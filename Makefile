VERSION := 0.0.1
DOCKER_IMAGE := "api:v0.0.1"

build:
	@docker build -f Dockerfile -t ${DOCKER_IMAGE} .

run: build
	@open http://localhost:8000
	@docker run -p 8000:80 ${DOCKER_IMAGE}

lint:
	@black app
	@flake8 app
	@isort app
	@mypy .
	@bandit app