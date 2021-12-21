FROM node:16-alpine

WORKDIR /app
COPY ./firebase .

RUN apk update
RUN apk add openjdk11
RUN npm install -g firebase-tools
CMD firebase emulators:start --import firebase_dummy_data