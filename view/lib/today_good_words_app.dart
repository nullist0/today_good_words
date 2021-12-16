import 'package:domain/phrase_images/phrase_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:view/screens/phrase_screen.dart';
import 'package:bloc/likes/like_state_bloc.dart';
import 'package:bloc/phrases/phrase_state_bloc.dart';

class TodayGoodWordsApp extends StatelessWidget {
  final PhraseStateBloc _phraseStateBloc;
  final LikeStateBloc _likeStateBloc;
  final PhraseImageBloc _phraseImageBloc;

  const TodayGoodWordsApp({
    Key? key,
    required PhraseStateBloc phraseStateBloc,
    required LikeStateBloc likeStateBloc,
    required PhraseImageBloc phraseImageBloc,
  }) : _phraseStateBloc = phraseStateBloc,
        _likeStateBloc = likeStateBloc,
        _phraseImageBloc = phraseImageBloc,
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
          phraseStateBloc: _phraseStateBloc,
          likeStateBloc: _likeStateBloc,
          phraseImageBloc: _phraseImageBloc,
        ),
      ),
    );
  }
}
