FROM node:${NODE_VERSION}-alpine

RUN mkdir -p /app

WORKDIR /app

ONBUILD COPY package.json /app/
ONBUILD COPY yarn.lock /app/

ONBUILD RUN yarn install && yarn cache clean

ONBUILD COPY . /app

ONBUILD RUN yarn build

CMD [ "yarn", "start" ]