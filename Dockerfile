FROM ubuntu:22.04
LABEL authors="Arsolitt"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt update -y && apt upgrade -y
RUN apt install -y language-pack-ru \
    software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN update-locale LANG=ru_RU.utf8
RUN apt install -y git \
    nodejs \
    npm \
    zsh \
    python3.11 \
    python3.11-dev \
    python3.11-gdbm \
    python3.11-venv \
    wget
RUN npm install -g pm2
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
WORKDIR /home/app
COPY . .
RUN python3.11 get-pip.py
RUN python3.11 setup.py

ENTRYPOINT ["python3.11", "main.py"]
