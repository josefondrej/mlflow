FROM python:3.10-slim-buster

ARG MLFLOW_VERSION

LABEL maintainer="Josef Ondrej <josef.ondrej@outlook.com>"

RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir mlflow[extras]~=$MLFLOW_VERSION
RUN pip install --no-cache-dir psycopg2-binary
RUN pip install --no-cache-dir pymysql
