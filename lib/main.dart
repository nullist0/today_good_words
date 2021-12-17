import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/date_strings/date_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_repository/like_firebase_repository.dart';
import 'package:firebase_repository/phrase_firebase_repository.dart';
import 'package:firebase_repository/phrase_theme_firebase_repository.dart';
import 'package:firebase_repository/user_uid_firebase_repository.dart';
import 'package:flutter/material.dart';
import 'package:native_bloc/likes/like_state_native_bloc.dart';
import 'package:native_bloc/phrase_images/phrase_image_native_bloc.dart';
import 'package:native_bloc/phrases/phrase_native_bloc.dart';
import 'package:filed_service/filed_share_service.dart';
import 'package:view/today_good_words_app.dart';

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
  var phraseBloc = PhraseStateNativeBloc(phraseRepository, phraseThemeRepository);
  var userRepository = UserUIDFirebaseRepository(FirebaseAuth.instance);
  var likeRepository = LikeFirebaseRepository(dateString, userRepository, FirebaseFirestore.instance);
  var likeBloc = LikeStateNativeBloc(likeRepository);
  var shareService = FiledShareService();
  var phraseImageBloc = PhraseImageNativeBloc(shareService);
  var app = TodayGoodWordsApp(
    phraseStateBloc: phraseBloc,
    likeStateBloc: likeBloc,
    phraseImageBloc: phraseImageBloc ,
  );

  runApp(app);
}
