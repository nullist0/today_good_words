import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/phrase_screen/wrappers/phrase_screen_state_wrapper.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';

import 'phrase_screen_state_wrapper_test.mocks.dart';

@GenerateMocks([PhraseStateAdapter, LikeStateAdapter])
void main() {
  late PhraseStateAdapter phraseStateAdapter;
  late LikeStateAdapter likeStateAdapter;
  late PhraseScreenStateWrapper phraseScreenStateWrapper;

  setUp(() {
    phraseStateAdapter = MockPhraseStateAdapter();
    likeStateAdapter = MockLikeStateAdapter();
    phraseScreenStateWrapper = PhraseScreenStateWrapper(phraseStateAdapter, likeStateAdapter);
  });

  test('phrase screen state wrapper must call adapter\'s states', () {
    // given
    when(phraseStateAdapter.states()).thenAnswer((_) => Stream.empty());
    when(likeStateAdapter.states()).thenAnswer((_) => Stream.empty());

    // when
    phraseScreenStateWrapper.states();

    // then
    verify(phraseStateAdapter.states());
    verify(likeStateAdapter.states());
  });
}