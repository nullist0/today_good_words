import 'package:bloc/likes/like_state.dart';
import 'package:bloc/phrases/phrase_state.dart';

class PhraseScreenState {
  final PhraseState phraseState;
  final LikeState likeState;

  PhraseScreenState(
      this.phraseState,
      this.likeState
    );
}