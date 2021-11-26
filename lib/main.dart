import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todaygoodwords/date_strings/date_string.dart';
import 'package:todaygoodwords/likes/repositories/like_firebase_repository.dart';
import 'package:todaygoodwords/phrase_images/share_services/filed_share_service.dart';
import 'package:todaygoodwords/phrase_themes/repositories/phrase_theme_firebase_repository.dart';
import 'package:todaygoodwords/phrases/repositories/phrase_firebase_repository.dart';
import 'package:todaygoodwords/users/repositories/user_uid_firebase_repository.dart';
import 'package:todaygoodwords/view/state/likes/blocs/like_state_bloc.dart';
import 'package:todaygoodwords/view/state/phrase_images/blocs/phrase_image_bloc.dart';
import 'package:todaygoodwords/view/state/phrases/blocs/phrase_state_bloc.dart';
import 'package:todaygoodwords/view/today_good_words_app.dart';

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
  dateString = DateString(DateTime(2020, 6, 1));

  var phraseRepository = PhraseFirebaseRepository(dateString, FirebaseFirestore.instance);
  var phraseThemeRepository = PhraseThemeFirebaseRepository(dateString, FirebaseFirestore.instance);
  var phraseStateBloc = PhraseStateBloc(phraseRepository, phraseThemeRepository);
  var userRepository = UserUIDFirebaseRepository(FirebaseAuth.instance);
  var likeRepository = LikeFirebaseRepository(dateString, userRepository, FirebaseFirestore.instance);
  var likeStateBloc = LikeStateBloc(likeRepository);
  var shareService = FiledShareService();
  var phraseImageBloc = PhraseImageBloc(shareService);
  var app = TodayGoodWordsApp(
    phraseStateAdapter: phraseStateBloc,
    likeStateAdapter: likeStateBloc,
    phraseImageAdapter: phraseImageBloc,
  );

  runApp(app);
}
