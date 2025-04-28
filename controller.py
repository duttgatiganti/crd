import kopf
import kubernetes
import yaml
import logging

kubernetes.config.load_incluster_config()

@kopf.on.create('example.com', 'v1', 'mtlspeers')
def create_mtlspeer(spec, name, namespace, **kwargs):
    api = kubernetes.client.CustomObjectsApi()

    pa_manifest = {
        "apiVersion": "security.istio.io/v1beta1",
        "kind": "PeerAuthentication",
        "metadata": {
            "name": f"peerauth-{namespace}",
            "namespace": spec.get('namespace')
        },
        "spec": {
            "mtls": {
                "mode": spec.get('mode')
            }
        }
    }

    logging.info(f"Creating PeerAuthentication for namespace {namespace}")
    api.create_namespaced_custom_object(
        group="security.istio.io",
        version="v1beta1",
        namespace=spec.get('namespace'),
        plural="peerauthentications",
        body=pa_manifest
    )

