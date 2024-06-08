FROM python:3.9-slim

WORKDIR /app

COPY . /app
RUN apt-get update
RUN apt install wget -y
RUN wget "https://model-cd-classification.s3.eu-north-1.amazonaws.com/best_epoch_cnn.h5"
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y


RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
