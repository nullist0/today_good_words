import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/date_strings/date_string.dart';
import 'package:domain/phrases/phrase.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_repository/phrase_firebase_repository.dart';
import 'package:flutter_test/flutter_test.dart';

extension PhraseFakeFirestore on FirebaseFirestore {
  Future<void> putPhrase(DateString dateString, Phrase phrase) {
    return collection('phrases')
        .doc(dateString.toString())
        .set(phrase.toJson());
  }
}

void main() {
  late FirebaseFirestore firestore;
  late DateString dateString;
  late PhraseFirebaseRepository phraseFirebaseRepository;

  setUp(() {
    dateString = DateString(DateTime.now());
    firestore = FakeFirebaseFirestore();
    phraseFirebaseRepository = PhraseFirebaseRepository(dateString, firestore);
  });
  
  test('phrase firebase repository reads from firestore', () async {
    // given
    final phrase = Phrase('name', 'text');

    // when
    await firestore.putPhrase(dateString, phrase);

    // then
    expectLater(phraseFirebaseRepository.read(), emits(phrase));
  });
}