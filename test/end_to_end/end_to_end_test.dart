import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';

import 'application_runner.dart';
import 'fake_phrase_repository.dart';

void main() {
  goodWordTestGroup();
}

void goodWordTestGroup() {
  group('Good Words Test', () {
    late ApplicationRunner app;

    testWidgets('display loading message when phrase is loading', (tester) async {
      app = ApplicationRunner(PhraseBloc(phraseRepositoryReadingNothing()));
      await app.startApp(tester);
      app.displayLoading();
    });

    testWidgets('display failed message when phrase is not loaded', (tester) async {
      app = ApplicationRunner(PhraseBloc(phraseRepositoryOccurErrorWhileReading()));
      await app.startApp(tester);
      app.displayFailure();
    });

    testWidgets('display correct phrase when phrase is loaded', (tester) async {
      var phrase = Phrase('name', 'text');
      app = ApplicationRunner(PhraseBloc(phraseRepositoryReadingOne(phrase)));
      await app.startApp(tester);
      app.displayPhrase(phrase);
    });
  });
}