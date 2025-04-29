# controller.py
import kopf
import kubernetes

@kopf.on.create('example.com', 'v1', 'mtlspeers')
def create_peerauth(spec, name, namespace, **kwargs):
    kubernetes.config.load_incluster_config()
    api = kubernetes.client.CustomObjectsApi()
    mode = spec.get('mode', 'STRICT')
    selector = spec.get('selector', {})

    body = {
        "apiVersion": "security.istio.io/v1beta1",
        "kind": "PeerAuthentication",
        "metadata": {
            "name": f"{name}-peerauth",
            "namespace": namespace
        },
        "spec": {
            "mtls": {
                "mode": mode
            },
            "selector": {
                "matchLabels": selector
            }
        }
    }

    api.create_namespaced_custom_object(
        group="security.istio.io",
        version="v1beta1",
        namespace=namespace,
        plural="peerauthentications",
        body=body
    )

