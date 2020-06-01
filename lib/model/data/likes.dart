import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaygoodwords/model/data/users.dart';

class WordLike{
  bool isLike;
  int likes;

  WordLike({
    this.isLike = false,
    this.likes = 0
  });

  static WordLike fromSnapshot(User user, QuerySnapshot data){
    return WordLike(
      isLike: data.documents.any((element) => element.documentID == user.uid),
      likes: data.documents.length
    );
  }
}