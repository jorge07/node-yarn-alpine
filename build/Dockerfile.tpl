FROM node:${NODE_VERSION}-alpine

RUN mkdir -p /app

WORKDIR /app

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV

ONBUILD COPY package.json /app/
ONBUILD COPY yarn.lock /app/

ONBUILD RUN yarn install && yarn cache clean

ONBUILD COPY . /app

CMD [ "yarn", "start" ]