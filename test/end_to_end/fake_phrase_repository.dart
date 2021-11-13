import 'package:mockito/annotations.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';
import 'package:mockito/mockito.dart';
import 'fake_phrase_repository.mocks.dart';

@GenerateMocks([PhraseRepository])
extension FakePhraseRepository on PhraseRepository {
  static PhraseRepository readingNothing() {
    var repository = MockPhraseRepository();

    when(repository.read()).thenAnswer((_) => Stream.empty());

    return repository;
  }

  static PhraseRepository occurErrorWhileReading() {
    var repository = MockPhraseRepository();

    when(repository.read()).thenAnswer((_) => Stream.error(Exception('error')));

    return repository;
  }

  static PhraseRepository readingOne(final Phrase phrase) {
    var repository = MockPhraseRepository();

    when(repository.read()).thenAnswer((_) => Stream.value(phrase));

    return repository;
  }
}
