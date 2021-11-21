import 'package:todaygoodwords/view/state/likes/like_state.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';

class PhraseScreenState {
  final PhraseState phraseState;
  final LikeState likeState;

  PhraseScreenState(this.phraseState, this.likeState);
}