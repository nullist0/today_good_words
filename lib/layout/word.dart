import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/words.dart';
import 'package:todaygoodwords/model/inherited_widget/user_inherited_widget.dart';
import 'package:todaygoodwords/model/stream_builder/like_stream_builder.dart';
import 'package:todaygoodwords/model/stream_builder/word_stream_builder.dart';
import 'package:todaygoodwords/view/widget/like.dart';
import 'package:todaygoodwords/view/widget/share.dart';
import 'package:todaygoodwords/view/widget/word.dart';

class WordLandscape extends StatefulWidget {
  @override
  _WordLandscapeState createState() => _WordLandscapeState();
}

class _WordLandscapeState extends State<WordLandscape> {
  final GlobalKey _wordWidgetKey = GlobalKey();

  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WordFirebaseStreamBuilder(
      date: _date,
      loadingWidget: _loadWidget,
      successWidget: _wordWidget,
      failedWidget: _failedWidget,
    );
  }

  Widget _loadWidget() {
    return WordWidget(saying: Word.loadWord(_date));
  }

  Widget _failedWidget() {
    return InkWell(
      child: WordWidget(saying: Word.failedWord(_date)),
      onTap: () => setState(() {})
    );
  }

  Widget _wordWidget(Word word) {
    return Stack(
      children: <Widget>[
        RepaintBoundary(
          key: _wordWidgetKey,
          child: WordWidget(saying: word),
        ),
        Positioned(
          top: 20, left: 10,
          child: ShareButton(wordWidgetKey: _wordWidgetKey,),
        ),
        Positioned(
          bottom: 20, left: 10,
          child: LikeFirebaseStreamBuilder(
            builder: (like) => LikeButton(like: like, date: word.date,),
            date: word.date,
            user: UserInheritedWidget.of(context)
          ),
        ),
      ],
    );
  }
}
