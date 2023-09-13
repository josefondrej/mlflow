# 🐋 MLflow Server Docker Image

Unofficial Dockerfile for [MLflow](https://mlflow.org/) server with out of the box support for PostgreSQL and S3 storage
as backend.

Published to Docker Hub https://hub.docker.com/r/josefondrej/mlflow

## Usage

The instructions below are for use with PostgreSQL and S3 storage as backend.
However, the image can be used with other backends as well.

### Pre-requisites

To run with PostgreSQL and S3 backend you need to have a PostgreSQL database and S3 compatible storage up and running
and corresponding credentials. These are:

- [ ] `AWS_ACCESS_KEY_ID` -- access key to your S3 storage (e.g. `KHM923OI3ND2022D2EEF`)
- [ ] `AWS_SECRET_ACCESS_KEY` -- secret access key to your S3 storage (e.g. `SDFKJ3230-99822JKDN2O2KJD2KJWDNJKSDF`)
- [ ] `MLFLOW_S3_ENDPOINT_URL` -- URL of your S3 storage (e.g. `https://fra1.digitaloceanspaces.com`)
- [ ] `BUCKET_NAME` -- name of the bucket in your S3 storage, where you want to store your experiment data (
 e.g. `mlflow-joe123`)
- [ ] `POSTGRES_URI` -- URI to your PostgreSQL database (
 e.g. `postgresql://mlflowUser:secret_password@postgres-cluster-do-user-1234567-0.b.db.ondigitalocean.com:25060/mlflow`)

### Run Locally

To run locally, export the credentials in pre-requisites as environment variables like this:

```bash
export AWS_ACCESS_KEY_ID=KHM923OI3ND2022D2EEF
export AWS_SECRET_ACCESS_KEY=SDFKJ3230-99822JKDN2O2KJD2KJWDNJKSDF
export MLFLOW_S3_ENDPOINT_URL=https://fra1.digitaloceanspaces.com
export BUCKET_NAME=mlflow-joe123
export POSTGRES_URI=postgresql://mlflowUser:secret_password@postgres-cluster-do-user-1234567-0.b.db.ondigitalocean.com:25060/mlflow
```

Then run the container with the following command:

```bash
docker run --rm -p 5000:5000 josefondrej/mlflow:2.6.0 mlflow server \
	--backend-store-uri $(POSTGRES_URI) \
	--default-artifact-root s3://$(BUCKET_NAME)/ \
	--host 0.0.0.0 \
	--port 5000
```
