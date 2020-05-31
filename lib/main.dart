import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaygoodwords/view/widget/date.dart';
import 'package:todaygoodwords/view/widget/like.dart';
import 'package:todaygoodwords/view/widget/logo.dart';
import 'package:todaygoodwords/view/widget/share.dart';
import 'package:todaygoodwords/view/widget/word.dart';

void main() {
  runApp(TodayGoodWords());
}

class TodayGoodWords extends StatelessWidget {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: Scaffold(
        body: LikeButton(),
      ),
    );
  }
}