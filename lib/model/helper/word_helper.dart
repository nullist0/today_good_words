import 'package:cloud_firestore/cloud_firestore.dart';

class WordFirebaseHelper {
  final DateTime date;
  WordFirebaseHelper({this.date});

  String toDocumentName(){
    return (date.year * 10000 + date.month * 100 + date.day).toString();
  }

  Future<DocumentSnapshot> read() {
    return Firestore.instance.collection('words').document(toDocumentName()).get();
  }
}