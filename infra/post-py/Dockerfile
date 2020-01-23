FROM python:3.6.0-alpine

RUN pip install flask pymongo

WORKDIR /app
ADD . /app

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

ENTRYPOINT ["python", "post_app.py"]