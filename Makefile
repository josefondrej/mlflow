BASE_NAME="josefondrej/mlflow-postgres"
MLFLOW_VERSION?=2.6.0

IMAGE_NAME="${BASE_NAME}:${MLFLOW_VERSION}"

.PHONY: help docker-build docker-push docker-run-local

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'

docker-build: ## Builds the MLflow server image
	docker build \
		--build-arg MLFLOW_VERSION=$(MLFLOW_VERSION) \
		-t $(IMAGE_NAME) .

docker-push: ## Push the MLflow server image to Docker Hub
	docker push $(IMAGE_NAME)

docker-run-local: ## Run the MLflow server locally on port 5000
	docker run -p 5000:5000 $(IMAGE_NAME) mlflow server \
		--backend-store-uri sqlite:///mlflow.db \
		--default-artifact-root ./mlruns \
		--host 0.0.0.0 \
		--port 5000
