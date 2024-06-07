FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN wget https://firebasestorage.googleapis.com/v0/b/janam-kosam-2cb0f.appspot.com/o/best_epoch_cnn.h5?alt=media&token=edc21052-aa86-486c-b51a-a99d9a5a81fb
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y


RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py", "--host=0.0.0.0", "--port=5000"]
