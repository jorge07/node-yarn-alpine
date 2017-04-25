FROM node:4.8-alpine

RUN npm i -g yarn

RUN mkdir -p /app

WORKDIR /app

ONBUILD COPY package.json /app/
ONBUILD COPY yarn.lock /app/

ONBUILD RUN yarn install && yarn cache clean

ONBUILD COPY . /app

ONBUILD RUN yarn build

CMD [ "yarn", "start" ]