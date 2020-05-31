import 'package:flutter/material.dart';
import 'package:todaygoodwords/view/widget/like.dart';
import 'package:todaygoodwords/view/widget/share.dart';
import 'package:todaygoodwords/view/widget/word.dart';

class WordLandscape extends StatelessWidget {
  final GlobalKey wordWidgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        RepaintBoundary(
          key: wordWidgetKey,
          child: WordWidget(),
        ),
        Positioned(
          top: 20, left: 10,
          child: ShareButton(wordWidgetKey: wordWidgetKey,),
        ),
        Positioned(
          bottom: 20, left: 10,
          child: LikeButton(),
        ),
      ],
    );
  }
}
