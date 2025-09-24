# Dockerfile
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /app

# Install dependencies
RUN apt-get update \
 && apt-get install -y netcat-openbsd fortune-mod cowsay bash \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Copy app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499
CMD ["/bin/bash","/app/wisecow.sh"]
