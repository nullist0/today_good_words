[![build](https://github.com/out-of-existence/TodayGoodWords/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/out-of-existence/TodayGoodWords/actions/workflows/build.yml)
[![codecov](https://codecov.io/gh/out-of-existence/TodayGoodWords/branch/master/graph/badge.svg?token=4RCKXZR28J)](https://codecov.io/gh/out-of-existence/TodayGoodWords)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

# Introduction

과거 만들었던 오늘의 좋은 말 애플리케이션을 Flutter로 보완하여 만든 프로젝트입니다.  
'오늘의 좋은 말'은 매일매일 다른 명언을 보면서 활력을 얻고 동기부여를 받아 도움을 주는 애플리케이션입니다.

# Feature

- Fetch a phrase and its theme data using Firebase.
- Send the like message to Firebase using Like button in UI.
- Share the screenshot of the phrase using share_plus package.

# How to run test

## Unit tests

To run unit tests of a specific package, move to the package directory and run the following command.

```bash
flutter test
```

To run all unit tests of packages, run the following command.

```bash
melos bootstrap
melos run test:unit
```

## Integration tests

To run integration tests, open the android emulator and run the following command.

```bash
melos bootstrap
melos run test:integration
```

# Architecture
<img src="https://user-images.githubusercontent.com/31719872/147385971-bebca534-2775-4b36-8fac-ef2760b1d597.png" width="400" />

The A -> B says that the component A has the dependency of the component B.

| Components          | Description                                                                                                                             |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| view                | This component contains the implementations of Flutter widgets.                                                                         |
| bloc                | This component contains the interfaces of converting the domain objects to the state objects for Flutter widgets in the view component. |
| native_bloc         | This component contains the interfaces of bloc and some interfaces of the domain component.                                             |
| domain              | This component contains the interfaces and the classes of the value objects  for this app service.                                      |
| firebase_repository | This component contains the implementations of the repository interfaces in the domain components, using the firebase dependencies.     |
| filed_service       | This component contains the implementations of the interfaces in the domain components, using the native system (i.e. Android, iOS).   This component is aimed to implements the interfaces by using the file system. |


# Result

![Date Captured Screen](https://github.com/Lee-Null/TodayGoodWords/blob/master/capture/2020-06-01.png?raw=true)
