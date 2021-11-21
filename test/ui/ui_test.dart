import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todaygoodwords/likes/like.dart';
import 'package:todaygoodwords/main.dart';
import 'package:todaygoodwords/phrase_themes/phrase_style.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/view/state/likes/like_state.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';

import 'fake_adapters/fake_like_state_adapter.dart';
import 'fake_adapters/fake_phrase_state_adapter.dart';

Finder _likeWidget() => find.bySemanticsLabel(RegExp(r'Like'));
Finder _loadingWidget() => find.text('불러오는 중입니다.');
Finder _failureWidget() => find.text('불러오는데 실패했습니다.');

void _displayPhrase(final WidgetTester tester, final Phrase phrase, final PhraseTheme phraseTheme) {
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

void _displayLike(final Like like) {
  expect(_likeWidget(), findsOneWidget);
  expect(find.text(like.count.toString()), findsOneWidget);
}

void main() {
  group('tests without Firebase dependencies', () {
    late PhraseStateAdapter phraseStateAdapter;
    late LikeStateAdapter likeStateAdapter;
    late Widget app;

    testWidgets('display loading message when phrase is loading', (tester) async {
      // given
      phraseStateAdapter = FakePhraseStateAdapter.doNothing();
      likeStateAdapter = FakeLikeStateAdapter.doNothing();
      app = TodayGoodWords(phraseStateAdapter: phraseStateAdapter, likeStateAdapter: likeStateAdapter);

      // when
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      // then
      expect(_loadingWidget(), findsOneWidget);
      expect(_likeWidget(), findsNothing);
    });

    testWidgets('display failed message when phrase is not loaded', (tester) async {
      // given
      phraseStateAdapter = FakePhraseStateAdapter.hasError();
      likeStateAdapter = FakeLikeStateAdapter.doNothing();
      app = TodayGoodWords(phraseStateAdapter: phraseStateAdapter, likeStateAdapter: likeStateAdapter);

      // when
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      // then
      expect(_failureWidget(), findsOneWidget);
      expect(_likeWidget(), findsNothing);
    });

    testWidgets('display correct phrase when phrase is loaded', (tester) async {
      // when
      var phrase = Phrase('name', 'text');
      var phraseTheme = PhraseTheme(PhraseStyle(10.0, Colors.black), PhraseStyle(18.0, Colors.grey));
      var like = Like(false, 30);
      phraseStateAdapter = FakePhraseStateAdapter.hasData(PhraseState(phrase, phraseTheme));
      likeStateAdapter = FakeLikeStateAdapter.hasData(LikeState(like));
      app = TodayGoodWords(phraseStateAdapter: phraseStateAdapter, likeStateAdapter: likeStateAdapter);

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      // then
      _displayPhrase(tester, phrase, phraseTheme);
      _displayLike(like);
    });

    testWidgets('touch like button then like repository must call once', (tester) async {
      // given
      var phrase = Phrase('name', 'text');
      var phraseTheme = PhraseTheme(PhraseStyle(10.0, Colors.black), PhraseStyle(18.0, Colors.grey));
      var like = Like(false, 30);
      phraseStateAdapter = FakePhraseStateAdapter.hasData(PhraseState(phrase, phraseTheme));
      likeStateAdapter = FakeLikeStateAdapter.hasData(LikeState(like));
      app = TodayGoodWords(phraseStateAdapter: phraseStateAdapter, likeStateAdapter: likeStateAdapter);

      // when
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.tap(_likeWidget());
      await tester.pumpAndSettle();

      // then
      verify(likeStateAdapter.switchLike()).called(1);
    });
  });
}