DOCKER_IMAGE := "{{cookiecutter.project_slug}}:{{cookiecutter.version}}"

build:
	@docker build -f Dockerfile -t ${DOCKER_IMAGE} .

run: build
	@open http://localhost:{{cookiecutter.project_port}}
	@docker run -p {{cookiecutter.project_port}}:80 ${DOCKER_IMAGE}

lint:
	@black app
	@flake8 app
	@isort app
	@mypy .
	@bandit app