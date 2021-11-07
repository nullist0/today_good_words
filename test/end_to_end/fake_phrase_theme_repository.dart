import 'package:mockito/annotations.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme_repository.dart';
import 'package:mockito/mockito.dart';
import './fake_phrase_theme_repository.mocks.dart';

@GenerateMocks([PhraseThemeRepository])
extension FakePhraseThemeRepository on PhraseThemeRepository {
  static PhraseThemeRepository readingNothing() {
    var repository = MockPhraseThemeRepository();

    when(repository.read()).thenAnswer((_) => Stream.empty());

    return repository;
  }

  static PhraseThemeRepository occurErrorWhileReading() {
    var repository = MockPhraseThemeRepository();

    when(repository.read()).thenAnswer((_) => Stream.error(Exception()));

    return repository;
  }

  static PhraseThemeRepository readingOne(final PhraseTheme phraseTheme) {
    var repository = MockPhraseThemeRepository();

    when(repository.read()).thenAnswer((_) => Stream.value(phraseTheme));

    return repository;
  }
}