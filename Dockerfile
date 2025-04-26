FROM python:3.11-slim

WORKDIR /app

COPY controller.py .

RUN pip install kopf kubernetes

CMD ["kopf", "run", "--standalone", "controller.py"]

