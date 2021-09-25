import 'package:mockito/annotations.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';
import 'package:mockito/mockito.dart';
import 'phrase_repository.mocks.dart';

@GenerateMocks([PhraseRepository])
PhraseRepository phraseRepositoryReadingNothing() {
  var repository = MockPhraseRepository();

  when(repository.read()).thenAnswer((_) => Stream.empty());

  return repository;
}