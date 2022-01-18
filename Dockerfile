ARG BASE_IMAGE="nvcr.io/nvidia/pytorch:21.05-py3"

FROM ${BASE_IMAGE} AS base

RUN ls
RUN apt-get update #&& install ffmpeg

# if you have a requirements file, copy it then install them (cleaner option)
COPY requirements.txt ./requirements.txt
RUN pip3 install -r requirements.txt

# alternatively to install them manually
RUN pip3 install torchmetrics \
 tensorboard \
 albumentations \
 mlflow

COPY main.py ./main.py
CMD ["python", "main.py"]