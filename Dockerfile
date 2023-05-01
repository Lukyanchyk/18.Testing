FROM python:3.11-slim

LABEL MAINTAINER="Mikalai Lukyanchyk"
LABEL description="A Docker container to serve a simple Python web server"

RUN apt update \
    && apt upgrade -y
RUN apt install -yqq mc vim curl wget git telnet netcat

RUN useradd -m phpuser
WORKDIR /home/phpuser/webserver
COPY ./pages/* ./pages/
COPY main.py ./

EXPOSE 8081
USER phpuser

ENTRYPOINT ["python", "main.py"] 
