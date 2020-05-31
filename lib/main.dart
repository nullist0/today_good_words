import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaygoodwords/view/layout/word.dart';

void main() {
  runApp(TodayGoodWords());
}

class TodayGoodWords extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: Scaffold(
        body: WordLandscape(),
      ),
    );
  }
}