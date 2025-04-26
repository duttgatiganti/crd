import kopf
import kubernetes
import logging
@kopf.on.startup()
def configure(settings: kopf.OperatorSettings, **_):
    settings.posting.level = logging.INFO
    kubernetes.config.load_incluster_config()

@kopf.on.create('mesh.example.com', 'v1alpha1', 'trafficpolicies')
@kopf.on.update('mesh.example.com', 'v1alpha1', 'trafficpolicies')
def apply_traffic_policy(spec, name, namespace, logger, **kwargs):
    service_name = spec.get('serviceName')
    rules = spec.get('rules', [])

    logger.info(f"Applying traffic policy {name} to service {service_name} with rules: {rules}")

    api = kubernetes.client.CoreV1Api()

    try:
        service = api.read_namespaced_service(name=service_name, namespace=namespace)

        # Update service annotations with traffic rules
        if not service.metadata.annotations:
            service.metadata.annotations = {}

        service.metadata.annotations['mesh.example.com/traffic-policy'] = str(rules)

        api.patch_namespaced_service(
            name=service_name,
            namespace=namespace,
            body={"metadata": {"annotations": service.metadata.annotations}}
        )

        logger.info(f"Updated annotations on service {service_name}")

    except kubernetes.client.exceptions.ApiException as e:
        logger.error(f"Failed to update service: {e}")

