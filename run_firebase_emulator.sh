#!/usr/bin/env bash

option=$1

if [ $option = "--start" ]; then
  docker run -d --name firebase-emulator -p 4000:4000 -p 8080:8080 -p 9099:9099 nullist/today-good-words-firebase-emulator

  while :
  do
    curl -f http://localhost:4000/ && exit 1
    sleep 1
  done
elif [ $option = "--stop" ]; then
  docker stop firebase-emulator
  docker rm firebase-emulator
else
  echo "usage: $0 [--start | --stop]"
fi
