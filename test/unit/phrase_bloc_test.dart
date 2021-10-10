import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';

import 'phrase_bloc_test.mocks.dart';

@GenerateMocks([PhraseRepository])
void main() {
  late PhraseRepository repository;
  late PhraseBloc phraseBloc;

  setUp(() {
    repository = MockPhraseRepository();
    phraseBloc = PhraseBloc(repository);
  });

  test('phrase bloc must call repository read', () {
    // given
    when(repository.read()).thenAnswer((_) => Stream.empty());

    // when
    phraseBloc.read();

    // then
    verify(repository.read());
  });
}