import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaygoodwords/util/date.dart';

class WordFirebaseHelper {
  final DateTime date;
  WordFirebaseHelper({this.date});

  Future<DocumentSnapshot> read() {
    return Firestore.instance.collection('words').document(date.toDateString()).get();
  }
}