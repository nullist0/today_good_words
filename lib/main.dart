import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaygoodwords/phrase_themes/repositories/phrase_theme_firebase_repository.dart';
import 'package:todaygoodwords/phrases/repositories/phrase_firebase_repository.dart';
import 'package:todaygoodwords/view/layout/word.dart';
import 'package:todaygoodwords/view/state/phrase_state_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var phraseRepository = PhraseFirebaseRepository(DateTime.now());
  var phraseThemeRepository = PhraseThemeFirebaseRepository(DateTime.now());
  var phraseStateBloc = PhraseStateBloc(phraseRepository, phraseThemeRepository);
  runApp(TodayGoodWords(phraseStateBloc: phraseStateBloc,));
}

class TodayGoodWords extends StatelessWidget {
  final PhraseStateBloc _phraseStateBloc;
  // final UserRepository _repository = UserRepositoryImpl();

  TodayGoodWords({Key? key, required PhraseStateBloc phraseStateBloc})
      : _phraseStateBloc = phraseStateBloc, super(key: key);

  @override
  Widget build(BuildContext context) {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
        home: Scaffold(
          body: WordLandscape(phraseStateBloc: _phraseStateBloc,)
        ),
    );
  }
}
