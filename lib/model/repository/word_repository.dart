import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaygoodwords/model/data/words.dart';
import 'package:todaygoodwords/util/date.dart';

abstract class WordRepository {
  Stream<Word> read();
}

class WordRepositoryImpl implements WordRepository {
  final DateTime date;
  WordRepositoryImpl(this.date);

  Stream<Word> read() {
    return FirebaseFirestore.instance
        .collection('words')
        .doc(date.toDateString())
        .snapshots()
        .map((event) => Word.fromSnapshot(date, event));
  }
}