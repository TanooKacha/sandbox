FROM node:13-alpine

RUN apk update \
    && apk add \
    sudo \
    git \
    bash \
    make

WORKDIR /finalend

ENV HOME=/finalend

RUN npm install -g gulp-cli @nestjs/cli

EXPOSE 3000

CMD [ "npm", "run", "start:dev" ]