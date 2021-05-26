FROM node:lts-buster-slim
SHELL ["bash", "-c"]
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y openssh-server sudo locales git zip unzip vim \
    tmux curl iproute2 dnsutils netcat inetutils-ping procps less python3-pip
RUN update-locale LANG=ja_JP.UTF-8 && locale-gen && echo 'eval $(locale)' >> /etc/profile
RUN mkdir -p /run/sshd && ssh-keygen -A
COPY entry .
ENTRYPOINT ./entry
