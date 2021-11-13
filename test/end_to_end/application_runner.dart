import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/likes/like.dart';
import 'package:todaygoodwords/main.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/view/state/likes/like_state_bloc.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_bloc.dart';

class ApplicationRunner {
  final Widget _app;

  ApplicationRunner(PhraseStateBloc phraseStateBloc, LikeStateBloc likeStateBloc)
      : _app = TodayGoodWords(phraseStateBloc: phraseStateBloc, likeStateAdapter: likeStateBloc);

  Future<void> startApp(final WidgetTester tester) async {
    await tester.pumpWidget(_app);
    await tester.pumpAndSettle();
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

    expect(name.style?.fontSize, phraseTheme.name.size);
    expect(text.style?.fontSize, phraseTheme.text.size);

    expect(name.style?.color, phraseTheme.name.color);
    expect(text.style?.color, phraseTheme.text.color);
  }

  void displayFailure() {
    expect(find.text('불러오는데 실패했습니다.'), findsOneWidget);
  }

  void displayLike(final Like like) {
    expect(find.bySemanticsLabel(RegExp(r'Like')), findsOneWidget);
    expect(find.text(like.count.toString()), findsOneWidget);
  }

  void notDisplayLike() {
    expect(find.bySemanticsLabel(RegExp(r'Like')), findsNothing);
  }
}