FROM node:lts-buster-slim
SHELL ["bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y openssh-server sudo locales git zip unzip vim \
    curl iproute2 dnsutils netcat inetutils-ping procps less python3-pip
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && locale-gen && update-locale LANG=ja_JP.UTF-8
RUN mkdir -p /run/sshd && ssh-keygen -A
COPY entry .
RUN rm -fr /var/lib/apt/lists/*
ENTRYPOINT ./entry
