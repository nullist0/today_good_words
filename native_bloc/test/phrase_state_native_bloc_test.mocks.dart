// Mocks generated by Mockito 5.0.16 from annotations
// in native_bloc/test/phrase_state_native_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:domain/phrases/phrase.dart' as _i4;
import 'package:domain/phrases/phrase_repository.dart' as _i2;
import 'package:domain/phrases/phrase_theme.dart' as _i6;
import 'package:domain/phrases/phrase_theme_repository.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [PhraseRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhraseRepository extends _i1.Mock implements _i2.PhraseRepository {
  MockPhraseRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<_i4.Phrase> read() =>
      (super.noSuchMethod(Invocation.method(#read, []),
          returnValue: Stream<_i4.Phrase>.empty()) as _i3.Stream<_i4.Phrase>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [PhraseThemeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPhraseThemeRepository extends _i1.Mock
    implements _i5.PhraseThemeRepository {
  MockPhraseThemeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Stream<_i6.PhraseTheme> read() =>
      (super.noSuchMethod(Invocation.method(#read, []),
              returnValue: Stream<_i6.PhraseTheme>.empty())
          as _i3.Stream<_i6.PhraseTheme>);
  @override
  String toString() => super.toString();
}
