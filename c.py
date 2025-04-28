import kopf
import logging

@kopf.on.create('greetings')
def greet_handler(spec, name, namespace, logger, **kwargs):
    message = spec.get('message', 'Hello, World!')
    logger.info(f"[CREATE] Greeting message from CRD: {message}")

@kopf.on.update('greetings')
def greet_update_handler(spec, name, namespace, logger, **kwargs):
    message = spec.get('message', 'Hello, World!')
    logger.info(f"[UPDATE] Greeting message from CRD: {message}")
