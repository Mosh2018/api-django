FROM python:3.8-alpine
MAINTAINER Mosh2020

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./app .

# creating user to runnig program
RUN adduser -D user
USER user
