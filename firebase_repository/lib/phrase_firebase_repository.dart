import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/date_strings/date_string.dart';
import 'package:domain/phrases/phrase.dart';
import 'package:domain/phrases/phrase_repository.dart';

class PhraseFirebaseRepository implements PhraseRepository {
  final DateString _date;
  final FirebaseFirestore _firestore;

  PhraseFirebaseRepository(this._date, this._firestore);

  String get _phraseCollectionPath => 'phrases';
  String get _phraseDocumentPath => _date.toString();

  @override
  Stream<Phrase> read() {
    return _firestore
        .collection(_phraseCollectionPath)
        .doc(_phraseDocumentPath)
        .snapshots()
        .map(_fromDocument);
  }

  Phrase _fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final Map<String, dynamic> data = doc.data() ?? {};
    return Phrase(
      data['name'],
      data['text']
    );
  }
}