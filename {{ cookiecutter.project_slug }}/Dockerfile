FROM python:{{cookiecutter.python_version}} AS build
WORKDIR /code
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir --upgrade -r requirements.txt
COPY ./app /code/app

FROM python:{{cookiecutter.python_version}}-slim AS production
WORKDIR /code
COPY --from=build /code/app /code/app
COPY --from=build /usr/local/lib/python{{cookiecutter.python_version}}/site-packages /usr/local/lib/python{{cookiecutter.python_version}}/site-packages
CMD ["python", "-m", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80", "--proxy-headers"]