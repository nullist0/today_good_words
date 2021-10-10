import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';
import 'package:todaygoodwords/phrases/repositories/phrase_firebase_repository.dart';
import 'package:todaygoodwords/view/layout/word.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var phraseBloc = PhraseBloc(PhraseFirebaseRepository(DateTime.now()));
  runApp(TodayGoodWords(phraseBloc: phraseBloc,));
}

class TodayGoodWords extends StatelessWidget {
  final PhraseBloc _phraseBloc;
  // final UserRepository _repository = UserRepositoryImpl();

  TodayGoodWords({Key? key, required PhraseBloc phraseBloc})
      : _phraseBloc = phraseBloc, super(key: key);

  @override
  Widget build(BuildContext context) {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
        home: Scaffold(
          body: WordLandscape(phraseBloc: _phraseBloc,)
        ),
    );
  }
}
