import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme_repository.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';
import 'package:todaygoodwords/view/state/phrases/blocs/phrase_state_bloc.dart';

import 'phrase_state_bloc_test.mocks.dart';

@GenerateMocks([PhraseRepository, PhraseThemeRepository])
void main() {
  late PhraseRepository phraseRepository;
  late PhraseThemeRepository phraseThemeRepository;
  late PhraseStateBloc phraseStateBloc;

  setUp(() {
    phraseRepository = MockPhraseRepository();
    phraseThemeRepository = MockPhraseThemeRepository();
    phraseStateBloc = PhraseStateBloc(phraseRepository, phraseThemeRepository);
  });

  test('phrase state must call repository read', () {
    // given
    when(phraseRepository.read()).thenAnswer((_) => Stream.empty());
    when(phraseThemeRepository.read()).thenAnswer((_) => Stream.empty());

    // when
    phraseStateBloc.states();

    // then
    verify(phraseRepository.read());
    verify(phraseThemeRepository.read());
  });
}