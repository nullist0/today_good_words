FROM node:16-alpine

WORKDIR /app
COPY ./firebase .

RUN apk update
RUN apk add openjdk11
RUN (cd functions; npm install)
RUN curl -sL https://firebase.tools | bash

CMD firebase emulators:start --import firebase_dummy_data
