# docker build -t mh-captcha-solver.
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

RUN apt-get update \
    && apt-get install -y --no-install-recommends tesseract-ocr libtesseract-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./app /app
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install --user -r /tmp/requirements.txt
