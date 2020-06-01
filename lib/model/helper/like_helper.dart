import 'package:todaygoodwords/model/data/users.dart';
import 'package:todaygoodwords/util/date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeFirebaseHelper {
  final DateTime date;
  LikeFirebaseHelper({this.date});

  Future<QuerySnapshot> read() {
    return Firestore.instance.collection('words/${date.toDateString()}/like').getDocuments();
  }

  Future<void> like(User user, bool isLiked) {
    if(isLiked)
      return Firestore.instance.collection('words/${date.toDateString()}/like').document(user.uid).setData({});
    else
      return Firestore.instance.collection('words/${date.toDateString()}/like').document(user.uid).delete();
  }
}