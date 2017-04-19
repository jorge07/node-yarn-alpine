FROM node:7.9-alpine

RUN mkdir -p /app

WORKDIR /app

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV

ONBUILD COPY package.json /usr/src/app/
ONBUILD COPY yarn.lock /usr/src/app/

ONBUILD RUN yarn install && yarn cache clean

ONBUILD COPY . /usr/src/app

CMD [ "yarn", "start" ]