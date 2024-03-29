// Mocks generated by Mockito 5.0.17 from annotations
// in firebase_repository/test/like_firebase_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:domain/users/user_uid.dart' as _i2;
import 'package:domain/users/user_uid_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUserUID_0 extends _i1.Fake implements _i2.UserUID {}

/// A class which mocks [UserUIDRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserUIDRepository extends _i1.Mock implements _i3.UserUIDRepository {
  MockUserUIDRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Stream<_i2.UserUID> read() =>
      (super.noSuchMethod(Invocation.method(#read, []),
          returnValue: Stream<_i2.UserUID>.empty()) as _i4.Stream<_i2.UserUID>);
  @override
  _i4.Future<_i2.UserUID> readCurrent() =>
      (super.noSuchMethod(Invocation.method(#readCurrent, []),
              returnValue: Future<_i2.UserUID>.value(_FakeUserUID_0()))
          as _i4.Future<_i2.UserUID>);
}
