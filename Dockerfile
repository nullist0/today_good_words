FROM node:16-alpine

WORKDIR /app
COPY ./firebase .

RUN apk update
RUN apk add openjdk11
RUN (cd functions; yarn install)
RUN curl -sL https://firebase.tools | bash

HEALTHCHECK --interval=5m --timeout=1s \
  CMD curl -f http://localhost:4000/ || exit 1

CMD firebase emulators:start --import firebase_dummy_data
