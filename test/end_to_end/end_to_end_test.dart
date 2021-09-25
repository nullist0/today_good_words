import 'package:flutter_test/flutter_test.dart';
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
      app.displayWords('불러오는 중입니다.');
    });
  });
}