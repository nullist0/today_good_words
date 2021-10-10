import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';

import 'application_runner.dart';
import 'fake_phrase_repository.dart';

void main() {
  group('E2E tests', () {
    late ApplicationRunner app;

    testWidgets('display loading message when phrase is loading', (tester) async {
      var phraseBloc = PhraseBloc(phraseRepositoryReadingNothing());
      var phraseThemeBloc = PhraseThemeBloc(phraseThemeRepositoryReadingNothing());

      app = ApplicationRunner(phraseBloc, phraseThemeBloc);

      await app.startApp(tester);
      app.displayLoading();
    });

    testWidgets('display failed message when phrase is not loaded', (tester) async {
      var phraseBloc = PhraseBloc(phraseRepositoryOccurErrorWhileReading());
      var phraseThemeBloc = PhraseThemeBloc(phraseThemeRepositoryOccurErrorWhileReading());

      app = ApplicationRunner(phraseBloc, phraseThemeBloc);

      await app.startApp(tester);
      app.displayFailure();
    });

    testWidgets('display correct phrase when phrase is loaded', (tester) async {
      var phrase = Phrase('name', 'text');
      var phraseTheme = PhraseTheme();
      var phraseBloc = PhraseBloc(phraseRepositoryReadingOne(phrase));
      var phraseThemeBloc = PhraseThemeBloc(phraseThemeRepositoryReadingOne(phraseTheme));

      app = ApplicationRunner(phraseBloc, phraseThemeBloc);

      await app.startApp(tester);
      app.displayPhrase(tester, phrase);
    });
  });
}