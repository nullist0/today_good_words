import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/main.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';

class ApplicationRunner {
  final Widget _app;
  
  ApplicationRunner(PhraseBloc phraseBloc) : _app = TodayGoodWords(phraseBloc: phraseBloc);
  
  Future<void> startApp(WidgetTester tester) async {
    await tester.pumpWidget(_app);
    await tester.pump(Duration.zero);
  }

  void displayLoading() {
    expect(find.text('불러오는 중입니다.'), findsOneWidget);
  }

  void displayPhrase(final Phrase phrase) {
    expect(find.text(phrase.name), findsOneWidget);
    expect(find.textContaining(phrase.text), findsOneWidget);
  }
}