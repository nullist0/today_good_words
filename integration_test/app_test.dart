import 'dart:ui';

import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:domain/likes/like.dart';
import 'package:domain/phrases/phrase_style.dart';
import 'package:domain/phrases/phrase_theme.dart';
import 'package:domain/phrases/phrase.dart';

import 'helpers/application_runner.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end tests', () {
    late ApplicationRunner runner;

    setUp(() async {
      runner = ApplicationRunner();
      await runner.startTestFirebase();
    });

    testWidgets('phrase load fail test', (tester) async {
      await runner.startApp(tester, currentWithoutData);

      runner.displayFailure();
      runner.notDisplayLike();
    });

    testWidgets('phrase load success test', (tester) async {
      final phrase = Phrase('name', 'text');
      final phraseTheme = PhraseTheme(
          PhraseStyle(18, Color(0xFF000000)),
          PhraseStyle(30, Color(0xFF000000))
      );
      final like = Like(false, 0);

      await runner.startApp(tester, currentWithData);

      runner.displayPhrase(tester, phrase, phraseTheme);
      runner.displayLike(like);
    });

    testWidgets('like button test when phrase is loaded', (tester) async {
      final liked = Like(true, 1);
      final unliked = Like(false, 0);

      await runner.startApp(tester, currentWithData);

      await runner.switchLike(tester);
      runner.displayLike(liked);

      await runner.switchLike(tester);
      runner.displayLike(unliked);
    });
  });
}
