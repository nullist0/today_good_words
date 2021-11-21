import 'package:flutter/material.dart';

import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/phrase_screen/phrase_screen_state.dart';
import 'package:todaygoodwords/view/state/phrase_screen/wrappers/phrase_screen_state_wrapper.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';
import 'package:todaygoodwords/view/widget/likes/like.dart';
import 'package:todaygoodwords/view/widget/phrases/failure.dart';
import 'package:todaygoodwords/view/widget/phrases/loading.dart';
import 'package:todaygoodwords/view/widget/phrases/phrase.dart';

class PhraseScreen extends StatelessWidget {
  final PhraseStateAdapter _phraseStateAdapter;
  final LikeStateAdapter _likeStateAdapter;

  const PhraseScreen({
    Key? key,
    required PhraseStateAdapter phraseStateAdapter,
    required LikeStateAdapter likeStateAdapter,
  }) : _phraseStateAdapter = phraseStateAdapter,
        _likeStateAdapter = likeStateAdapter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final phraseScreenStateAdapter = PhraseScreenStateWrapper(_phraseStateAdapter, _likeStateAdapter);

    return StreamBuilder<PhraseScreenState>(
      stream: phraseScreenStateAdapter.states(),
      builder: (_, stateSnapshot) {
        if (stateSnapshot.hasError) {
          print(stateSnapshot.error);
          return FailureWidget();
        }
        if (stateSnapshot.hasData) {
          var screenState = stateSnapshot.data!;
          var phraseState = screenState.phraseState;
          var likeState = screenState.likeState;

          return Stack(
            children: <Widget>[
              PhraseWidget(phraseState: phraseState),
              Positioned(
                bottom: 20,
                left: 10,
                child: LikeWidget(
                  likeState: likeState,
                  switchLike: _likeStateAdapter.switchLike,
                ),
              ),
              // Positioned(
              //   top: 20, left: 10,
              //   child: ShareButton(onTap: _share,),
              // ),
            ]
          );
        }
        return LoadingWidget();
      }
    );
  }
}
