import kopf
import kubernetes.client
from kubernetes.client.rest import ApiException

@kopf.on.create('v1', 'services')
def create_peer_auth(body, **kwargs):
    labels = body.get('spec', {}).get('selector', {})
    if not labels:
        return

    app_label = labels.get('app')
    if not app_label:
        return

    name = f"{app_label}-peerauth"
    namespace = body['metadata']['namespace']

    peer_auth = {
        "apiVersion": "security.istio.io/v1beta1",
        "kind": "PeerAuthentication",
        "metadata": {
            "name": name,
            "namespace": namespace
        },
        "spec": {
            "selector": {
                "matchLabels": {
                    "app": app_label
                }
            },
            "mtls": {
                "mode": "STRICT"
            }
        }
    }

    crd_api = kubernetes.client.CustomObjectsApi()
    try:
        crd_api.create_namespaced_custom_object(
            group="security.istio.io",
            version="v1beta1",
            namespace=namespace,
            plural="peerauthentications",
            body=peer_auth
        )
        print(f"PeerAuthentication {name} created.")
    except ApiException as e:
        if e.status != 409:
            raise
        print(f"PeerAuthentication {name} already exists.")

