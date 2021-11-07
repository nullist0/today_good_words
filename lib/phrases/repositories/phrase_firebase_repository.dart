import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaygoodwords/util/date.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';

class PhraseFirebaseRepository implements PhraseRepository {
  final DateTime _date;
  PhraseFirebaseRepository(this._date);

  @override
  Stream<Phrase> read() {
    return FirebaseFirestore.instance
        .collection('phrases')
        .doc(_date.toDateString())
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