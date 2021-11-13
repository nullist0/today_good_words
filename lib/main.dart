import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaygoodwords/likes/repositories/like_firebase_repository.dart';
import 'package:todaygoodwords/phrase_themes/repositories/phrase_theme_firebase_repository.dart';
import 'package:todaygoodwords/phrases/repositories/phrase_firebase_repository.dart';
import 'package:todaygoodwords/users/repositories/user_uid_firebase_repository.dart';
import 'package:todaygoodwords/view/layout/word.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/likes/like_state_bloc.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var date = DateTime(2020, 6, 1);
  var phraseRepository = PhraseFirebaseRepository(date);
  var phraseThemeRepository = PhraseThemeFirebaseRepository(date);
  var phraseStateBloc = PhraseStateBloc(phraseRepository, phraseThemeRepository);
  var userRepository = UserUIDFirebaseRepository();
  var likeRepository = LikeFirebaseRepository(date, userRepository);
  var likeStateBloc = LikeStateBloc(likeRepository);

  runApp(TodayGoodWords(phraseStateBloc: phraseStateBloc, likeStateAdapter: likeStateBloc,));
}

class TodayGoodWords extends StatelessWidget {
  final PhraseStateBloc _phraseStateBloc;
  final LikeStateAdapter _likeStateAdapter;

  TodayGoodWords({Key? key, required PhraseStateBloc phraseStateBloc, required LikeStateAdapter likeStateAdapter})
      : _phraseStateBloc = phraseStateBloc, _likeStateAdapter = likeStateAdapter, super(key: key);

  @override
  Widget build(BuildContext context) {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
        home: Scaffold(
          body: WordLandscape(phraseStateBloc: _phraseStateBloc, likeStateAdapter: _likeStateAdapter,)
        ),
    );
  }
}
