# Dockerfile
FROM python:3.9-slim

RUN pip install kopf kubernetes

COPY controller.py /controller.py

CMD ["kopf", "run", "--standalone", "/controller.py"]

