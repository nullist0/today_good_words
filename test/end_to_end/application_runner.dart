import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/main.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';

class ApplicationRunner {
  final Widget _app;
  
  ApplicationRunner(PhraseBloc phraseBloc) : _app = TodayGoodWords(phraseBloc: phraseBloc);
  
  Future<void> startApp(WidgetTester tester) {
    return tester.pumpWidget(_app);
  }

  void displayWords(String word) {
    expect(find.text(word), findsOneWidget);
  }
}