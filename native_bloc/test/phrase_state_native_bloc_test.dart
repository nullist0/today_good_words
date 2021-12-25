import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/phrases/phrase_theme_repository.dart';
import 'package:domain/phrases/phrase_repository.dart';
import 'package:native_bloc/phrases/phrase_native_bloc.dart';

import 'phrase_state_native_bloc_test.mocks.dart';

@GenerateMocks([PhraseRepository, PhraseThemeRepository])
void main() {
  late PhraseRepository phraseRepository;
  late PhraseThemeRepository phraseThemeRepository;
  late PhraseStateNativeBloc phraseStateBloc;

  setUp(() {
    phraseRepository = MockPhraseRepository();
    phraseThemeRepository = MockPhraseThemeRepository();
    phraseStateBloc = PhraseStateNativeBloc(phraseRepository, phraseThemeRepository);
  });

  test('phrase state must call repository read', () {
    // given
    when(phraseRepository.read()).thenAnswer((_) => const Stream.empty());
    when(phraseThemeRepository.read()).thenAnswer((_) => const Stream.empty());

    // when
    phraseStateBloc.states();

    // then
    verify(phraseRepository.read());
    verify(phraseThemeRepository.read());
  });
}
