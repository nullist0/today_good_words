import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/words.dart';
import 'package:todaygoodwords/model/helper/word_helper.dart';

class WordFirebaseStreamBuilder extends StatelessWidget {
  final Widget Function(Word) successWidget;
  final Widget Function() loadingWidget, failedWidget;
  final DateTime date;

  const WordFirebaseStreamBuilder(
      {
        Key key,
        this.loadingWidget,
        this.successWidget,
        this.failedWidget,
        this.date
      }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: WordFirebaseHelper(date: date).read().asStream(),
      builder: (context, snap){
        if(snap.hasData && snap.data.data != null)
          return successWidget(Word.fromSnapshot(date, snap.data));
        else if(!snap.hasError && !snap.hasData)
          return loadingWidget();
        else
          return failedWidget();
      }
    );
  }
}
