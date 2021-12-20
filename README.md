[![Codemagic build status](https://api.codemagic.io/apps/5f70828e40212b743c0d1d56/5f70828e40212b743c0d1d55/status_badge.svg)](https://codemagic.io/apps/5f70828e40212b743c0d1d56/5f70828e40212b743c0d1d55/latest_build)
[![codecov](https://codecov.io/gh/out-of-existence/TodayGoodWords/branch/master/graph/badge.svg?token=4RCKXZR28J)](https://codecov.io/gh/out-of-existence/TodayGoodWords)

# Introduction

과거 만들었던 오늘의 좋은말을 Flutter로 보완하여 만든 프로젝트입니다.

# Feature

- Fetch phrase and its theme data using Firebase
- Send like message to Firebase using Like button
- Share a screenshot of the phrase using share_plus

# How to run test

## Unit tests

```shell
flutter test
```

## Integration tests

To run integration tests, build and run docker image as following.

```shell
export FIREBASE_TOKEN=${FIREBASE_TOKEN}
docker build --build-arg FIREBASE_TOKEN=$FIREBASE_TOKEN -t firebase-emulator .
docker run -d -p 8080:8080 -p 9099:9099 firebase-emulator
```

# Result

![Date Captured Screen](https://github.com/Lee-Null/TodayGoodWords/blob/master/capture/2020-06-01.png?raw=true)
