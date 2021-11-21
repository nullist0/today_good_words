import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaygoodwords/view/screens/phrase_screen.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/phrase_images/phrase_image_adapter.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';

class TodayGoodWordsApp extends StatelessWidget {
  final PhraseStateAdapter _phraseStateAdapter;
  final LikeStateAdapter _likeStateAdapter;
  final PhraseImageAdapter _phraseImageAdapter;

  TodayGoodWordsApp({
    Key? key,
    required PhraseStateAdapter phraseStateAdapter,
    required LikeStateAdapter likeStateAdapter,
    required PhraseImageAdapter phraseImageAdapter,
  }) : _phraseStateAdapter = phraseStateAdapter,
        _likeStateAdapter = likeStateAdapter,
        _phraseImageAdapter = phraseImageAdapter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
      home: Scaffold(
        body: PhraseScreen(
          phraseStateAdapter: _phraseStateAdapter,
          likeStateAdapter: _likeStateAdapter,
          phraseImageAdapter: _phraseImageAdapter,
        ),
      ),
    );
  }
}
