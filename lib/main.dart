import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todaygoodwords/date_strings/date_string.dart';
import 'package:todaygoodwords/likes/repositories/like_firebase_repository.dart';
import 'package:todaygoodwords/phrase_themes/repositories/phrase_theme_firebase_repository.dart';
import 'package:todaygoodwords/phrases/repositories/phrase_firebase_repository.dart';
import 'package:todaygoodwords/users/repositories/user_uid_firebase_repository.dart';
import 'package:todaygoodwords/view/screens/phrase_screen.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/likes/blocs/like_state_bloc.dart';
import 'package:todaygoodwords/view/state/phrases/blocs/phrase_state_bloc.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  late DateString dateString;
  if (args.isNotEmpty) {
    dateString = DateString(DateTime.parse(args[0]));
  }
  else {
    dateString = DateString.now();
  }

  var phraseRepository = PhraseFirebaseRepository(dateString, FirebaseFirestore.instance);
  var phraseThemeRepository = PhraseThemeFirebaseRepository(dateString, FirebaseFirestore.instance);
  var phraseStateBloc = PhraseStateBloc(phraseRepository, phraseThemeRepository);
  var userRepository = UserUIDFirebaseRepository(FirebaseAuth.instance);
  var likeRepository = LikeFirebaseRepository(dateString, userRepository, FirebaseFirestore.instance);
  var likeStateBloc = LikeStateBloc(likeRepository);

  runApp(TodayGoodWords(
    phraseStateAdapter: phraseStateBloc,
    likeStateAdapter: likeStateBloc,
  ));
}

class TodayGoodWords extends StatelessWidget {
  final PhraseStateAdapter _phraseStateAdapter;
  final LikeStateAdapter _likeStateAdapter;

  TodayGoodWords({Key? key, required PhraseStateAdapter phraseStateAdapter, required LikeStateAdapter likeStateAdapter})
      : _phraseStateAdapter = phraseStateAdapter, _likeStateAdapter = likeStateAdapter, super(key: key);

  @override
  Widget build(BuildContext context) {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    return MaterialApp(
        home: Scaffold(
          body: PhraseScreen(phraseStateAdapter: _phraseStateAdapter, likeStateAdapter: _likeStateAdapter,)
        ),
    );
  }
}
