import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';

import 'fake_phrase_state_adapter.mocks.dart';

@GenerateMocks([PhraseStateAdapter])
extension FakePhraseStateAdapter on PhraseStateAdapter {
  static PhraseStateAdapter doNothing() {
    var repository = MockPhraseStateAdapter();

    when(repository.states()).thenAnswer((_) => Stream.empty());

    return repository;
  }

  static PhraseStateAdapter hasData(final PhraseState phraseState) {
    var repository = MockPhraseStateAdapter();

    when(repository.states()).thenAnswer((_) => Stream.value(phraseState));

    return repository;
  }
  static PhraseStateAdapter hasError() {
    var repository = MockPhraseStateAdapter();

    when(repository.states()).thenAnswer((_) => Stream.error(Exception('there is no data')));

    return repository;
  }
}