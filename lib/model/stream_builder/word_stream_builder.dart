import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/helper/word_helper.dart';

class WordFirebaseStreamBuilder extends StatelessWidget {
  final Widget loadingWidget, successWidget, failedWidget;
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
    return StreamBuilder(
      stream: WordFirebaseHelper(date: date).read().asStream(),
      builder: (context, snap){
        if(snap.hasData)
          return successWidget;
        else if(!snap.hasError)
          return loadingWidget;
        else
          return failedWidget;
      }
    );
  }
}
