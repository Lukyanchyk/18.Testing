FROM python:3.11-slim

LABEL MAINTAINER="Mikalai Lukyanchyk"
LABEL description="A Docker container to serve a simple Python web server"

RUN apt-get update \
    && apt-get upgrade -y

RUN useradd -m phpuser
WORKDIR /home/phpuser/webserver
COPY ./pages/* ./pages/
COPY main.py ./

EXPOSE 8081
USER phpuser

ENTRYPOINT ["python", "main.py"] 
