# Build:
# docker build -t penpenny/notificationservice .
#
# Run:
# docker run -it penpenny/notificationservice
#
# Compose:
# docker-compose up -d

FROM ubuntu:latest
MAINTAINER PENPENNY

# 3012 = PENPENNY NOTIFICATION SERVICE
EXPOSE 3012

# Set development environment as default
ENV ENVIRONMENT Development

# Install Utilities
RUN apt-get update -y  \
 && apt-get install -y \
 curl \
 sudo \
 gnupg


# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

WORKDIR /opt/penpenny-v3-notification-service

# Copies the local package.json file to the container
# and utilities docker container cache to not needing to rebuild
# and install node_modules/ everytime we build the docker, but only
# when the local package.json file changes.
# Install npm packages
COPY package.json /opt/penpenny-v3-notification-service/package.json

COPY . /opt/penpenny-v3-notification-service

# Run PENPENNY NOTIFICATION SERVICE server
CMD npm install && npm start
