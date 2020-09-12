FROM python:3.8-alpine
MAINTAINER Mosh2020

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY ./requirements.txt .
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apk del .tmp-build-deps

COPY ./app .

# creating user to runnig program
RUN adduser -D user
USER user
