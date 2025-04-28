FROM python:3.11-slim
RUN pip install kopf kubernetes pyyaml
COPY controller.py /controller.py
ENTRYPOINT ["kopf", "run", "/controller.py"]

