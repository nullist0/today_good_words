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
  late FirebaseFirestore firebaseFirestore;
  late DateString dateString;
  late PhraseFirebaseRepository phraseFirebaseRepository;

  setUp(() {
    dateString = DateString(DateTime.now());
    firebaseFirestore = FakeFirebaseFirestore();
    phraseFirebaseRepository = PhraseFirebaseRepository(dateString, firebaseFirestore);
  });
  
  test('phrase firebase repository reads from firestore', () async {
    // given
    final phrase = Phrase('name', 'text');

    // when
    await firebaseFirestore.putPhrase(dateString, phrase);

    // then
    final phraseStream = phraseFirebaseRepository.read();
    expectLater(phraseStream, emits(phrase));
  });
}