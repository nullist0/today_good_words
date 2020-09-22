import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todaygoodwords/model/data/users.dart';
import 'package:todaygoodwords/model/repository/user_repository.dart';
import 'package:todaygoodwords/view/layout/word.dart';

void main() {
  runApp(TodayGoodWords());
}

class TodayGoodWords extends StatelessWidget {
  final UserRepository _repository = UserRepositoryImpl();

  Future<void> _initialize() {
    //SET Orientation
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    //SET FullScreen
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Firebase.initializeApp().then((_) => _repository.login());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialize(),
      builder: (context, snapshot) {
        return StreamProvider<User>(
          create: (_) => _repository.read(),
          child: MaterialApp(
            home: Scaffold(
              body: WordLandscape()
            ),
          ),
        );
      }
    );
  }
}
