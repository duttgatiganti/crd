import kopf
import kubernetes
from kubernetes.client import AppsV1Api

@kopf.timer('autoscaler.example', interval=30.0)
def autoscale(spec, name, namespace, logger, **kwargs):
    # Get values from the spec in the CR
    cpu_threshold_high = spec.get('cpuThresholdHigh')  # Default to 50 millicores
    cpu_threshold_low = spec.get('cpuThresholdLow')  # Default to 25 millicores
    min_replicas = spec.get('minReplicas')  # Default to 1 replica
    max_replicas = spec.get('maxReplicas')  # Default to 5 replicas
    target_deployment = spec.get('scaleTargetRef', {}).get('name')

    if not target_deployment:
        logger.warning("No target deployment defined.")
        return

    # Load Kubernetes configuration
    kubernetes.config.load_incluster_config()
    api = kubernetes.client.CustomObjectsApi()
    apps_api = AppsV1Api()
    metrics_api = kubernetes.client.CustomObjectsApi()

    # Get pods with label matching the target deployment
    core_api = kubernetes.client.CoreV1Api()
    pod_list = core_api.list_namespaced_pod(
        namespace=namespace,
        label_selector=f'app={target_deployment}'
    ).items

    if not pod_list:
        logger.warning("No matching pods found.")
        return

    # Fetch CPU usage for each pod
    total_cpu = 0.0
    for pod in pod_list:
        try:
            metrics = metrics_api.get_namespaced_custom_object(
                group="metrics.k8s.io",
                version="v1beta1",
                namespace=namespace,
                plural="pods",
                name=pod.metadata.name
            )
            for container in metrics['containers']:
                usage = container['usage']['cpu']
                if usage.endswith("n"):
                    total_cpu += int(usage.strip("n")) / 1e6  # Convert from nano to millicores
                elif usage.endswith("m"):
                    total_cpu += float(usage.strip("m"))
        except Exception as e:
            logger.warning(f"Failed to get metrics for pod {pod.metadata.name}: {e}")

    avg_cpu = total_cpu / len(pod_list)
    logger.info(f"[{namespace}/{name}] Avg CPU: {avg_cpu:.2f} millicores, Current replicas: {len(pod_list)}")

    # Fetch current deployment to get replica count
    deployment = apps_api.read_namespaced_deployment(name=target_deployment, namespace=namespace)
    current_replicas = deployment.spec.replicas

    # Scaling logic based on CPU thresholds
    if avg_cpu > cpu_threshold_high and current_replicas < max_replicas:
        new_replicas = current_replicas + 1
    elif avg_cpu < cpu_threshold_low and current_replicas > min_replicas:
        new_replicas = current_replicas - 1
    else:
        logger.info(f"[{namespace}/{name}] No scaling needed.")
        return

    # Patch deployment scale
    logger.info(f"[{namespace}/{name}] Scaling deployment {target_deployment} to {new_replicas} replicas")
    apps_api.patch_namespaced_deployment_scale(
        name=target_deployment,
        namespace=namespace,
        body={"spec": {"replicas": new_replicas}}
    )

