import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/likes.dart';
import 'package:todaygoodwords/model/data/users.dart';
import 'package:todaygoodwords/model/helper/like_helper.dart';

class LikeFirebaseStreamBuilder extends StatelessWidget {
  final Widget Function(WordLike) builder;
  final DateTime date;
  final User user;

  const LikeFirebaseStreamBuilder(
      {
        Key key,
        this.builder,
        this.date,
        this.user
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: LikeFirebaseHelper(date: date).read().asStream(),
        builder: (context, snap){
          if(snap.hasData)
            return builder(WordLike.fromSnapshot(user, snap.data));
          else
            return builder(WordLike());
        }
    );
  }
}
