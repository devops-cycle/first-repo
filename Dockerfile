FROM node:12.22.1
LABEL maintainer="Jivan Ghadage <jivan@penpenny.io>"

WORKDIR /var/www/app

COPY package.json /var/www/app

RUN npm install

COPY . /var/www/app

CMD ["node", "server.js"]
