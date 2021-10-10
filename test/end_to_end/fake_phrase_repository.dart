import 'package:mockito/annotations.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';
import 'package:mockito/mockito.dart';
import 'phrase_repository.mocks.dart';

@GenerateMocks([PhraseRepository])
PhraseRepository phraseRepositoryReadingNothing() {
  var repository = MockPhraseRepository();

  when(repository.read()).thenAnswer((_) => Stream.empty());

  return repository;
}

@GenerateMocks([PhraseRepository])
PhraseRepository phraseRepositoryOccurErrorWhileReading() {
  var repository = MockPhraseRepository();

  when(repository.read()).thenAnswer((_) => Stream.error(Exception()));

  return repository;
}

@GenerateMocks([PhraseRepository])
PhraseRepository phraseRepositoryReadingOne(final Phrase phrase) {
  var repository = MockPhraseRepository();

  when(repository.read()).thenAnswer((_) => Stream.value(phrase));

  return repository;
}