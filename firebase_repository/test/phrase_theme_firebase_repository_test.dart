import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/date_strings/date_string.dart';
import 'package:domain/phrases/phrase_style.dart';
import 'package:domain/phrases/phrase_theme.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_repository/phrase_theme_firebase_repository.dart';
import 'package:flutter_test/flutter_test.dart';

extension PhraseThemeFakeFirestore on FirebaseFirestore {
  Future<void> putPhraseTheme(DateString dateString, PhraseTheme phraseTheme) {
    return collection('phrase_themes')
        .doc(dateString.toString())
        .set(phraseTheme.toJson());
  }
}

void main() {
  late FirebaseFirestore firebaseFirestore;
  late DateString dateString;
  late PhraseThemeFirebaseRepository phraseThemeFirebaseRepository;

  setUp(() {
    dateString = DateString(DateTime.now());
    firebaseFirestore = FakeFirebaseFirestore();
    phraseThemeFirebaseRepository = PhraseThemeFirebaseRepository(dateString, firebaseFirestore);
  });
  
  test('phrase theme firebase repository reads from firestore', () async {
    // given
    final namePhraseStyle = PhraseStyle(10.0, const Color.fromARGB(1, 2, 3, 4));
    final textPhraseStyle = PhraseStyle(13.0, const Color.fromARGB(5, 6, 7, 8));
    final phraseTheme = PhraseTheme(namePhraseStyle, textPhraseStyle);

    // when
    await firebaseFirestore.putPhraseTheme(dateString, phraseTheme);

    // then
    expectLater(phraseThemeFirebaseRepository.read(), emits(phraseTheme));
  });
}