# Dockerfile
FROM python:3.10-slim
RUN pip install kopf kubernetes
COPY controller.py /app/controller.py
CMD ["kopf", "run", "--namespace=default", "/app/controller.py"]

