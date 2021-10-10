import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/main.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';

class ApplicationRunner {
  final Widget _app;
  
  ApplicationRunner(PhraseBloc phraseBloc, PhraseThemeBloc phraseThemeBloc)
      : _app = TodayGoodWords(phraseBloc: phraseBloc, phraseThemeBloc: phraseThemeBloc);
  
  Future<void> startApp(final WidgetTester tester) async {
    await tester.pumpWidget(_app);
    await tester.pump(Duration.zero);
  }

  void displayLoading() {
    expect(find.text('불러오는 중입니다.'), findsOneWidget);
  }

  void displayPhrase(final WidgetTester tester, final Phrase phrase, final PhraseTheme phraseTheme) {
    final nameFinder = find.text(phrase.name);
    final textFinder = find.textContaining(phrase.text);

    expect(nameFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);

    var name = tester.firstWidget(nameFinder) as Text;
    var text = tester.firstWidget(textFinder) as Text;

    expect(name.style?.fontSize, phraseTheme.name.fontSize);
    expect(text.style?.fontSize, phraseTheme.text.fontSize);

    expect(name.style?.color, Color(phraseTheme.name.color));
    expect(text.style?.color, Color(phraseTheme.text.color));
  }

  void displayFailure() {
    expect(find.text('불러오는데 실패했습니다.'), findsOneWidget);
  }
}