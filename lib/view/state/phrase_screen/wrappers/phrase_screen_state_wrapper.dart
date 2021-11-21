import 'package:rxdart/streams.dart';
import 'package:todaygoodwords/view/state/likes/like_state.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/phrase_screen/phrase_screen_state.dart';
import 'package:todaygoodwords/view/state/phrase_screen/phrase_screen_state_adapter.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';

class PhraseScreenStateWrapper implements PhraseScreenStateAdapter {
  final PhraseStateAdapter _phraseStateAdapter;
  final LikeStateAdapter _likeStateAdapter;

  const PhraseScreenStateWrapper(
    PhraseStateAdapter phraseStateAdapter,
    LikeStateAdapter likeStateAdapter,
  ): _phraseStateAdapter = phraseStateAdapter,
     _likeStateAdapter = likeStateAdapter;

  @override
  Stream<PhraseScreenState> states() {
    return CombineLatestStream.combine2(
      _phraseStateAdapter.states(),
      _likeStateAdapter.states(),
      (PhraseState phraseState, LikeState likeState) =>
          PhraseScreenState(phraseState, likeState)
    );
  }
}