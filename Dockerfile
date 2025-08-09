FROM node:lts-bookworm-slim
SHELL ["bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends openssh-server sudo locales git unzip vim \
  curl iproute2 dnsutils ncat netcat-openbsd inetutils-ping procps less python3-pip \
 && apt-get clean && rm -fr /var/lib/apt/lists/*
RUN mkdir -p /run/sshd && ssh-keygen -A
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen \
 && update-locale LANG=ja_JP.UTF-8 \
 && echo "export TZ=Asia/Tokyo" | tee -a /etc/bash.bashrc
EXPOSE 22
COPY entry .
ENTRYPOINT ./entry
