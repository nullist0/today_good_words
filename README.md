[![build](https://github.com/out-of-existence/TodayGoodWords/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/out-of-existence/TodayGoodWords/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/out-of-existence/TodayGoodWords/branch/master/graph/badge.svg?token=4RCKXZR28J)](https://codecov.io/gh/out-of-existence/TodayGoodWords)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

# Introduction

과거 만들었던 오늘의 좋은말을 Flutter로 보완하여 만든 프로젝트입니다.

# Feature

- Fetch phrase and its theme data using Firebase
- Send like message to Firebase using Like button
- Share a screenshot of the phrase using share_plus

# How to run test

## Unit tests

To run unit tests of specific package, move to the package directory and run the following command.

```shell
flutter test
```

To run all unit tests of packages, run the following command.

```shell
melos bootstrap
melos run test
```

## Integration tests

To run integration tests, run the following command.

```shell
melos bootstrap
melos run test:integration
```

# Result

![Date Captured Screen](https://github.com/Lee-Null/TodayGoodWords/blob/master/capture/2020-06-01.png?raw=true)
