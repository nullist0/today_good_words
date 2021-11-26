import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/state/phrase_images/phrase_image_adapter.dart';
import 'package:todaygoodwords/view/state/phrase_screen/phrase_screen_state.dart';
import 'package:todaygoodwords/view/state/phrase_screen/wrappers/phrase_screen_state_wrapper.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_adapter.dart';
import 'package:todaygoodwords/view/widget/likes/like.dart';
import 'package:todaygoodwords/view/widget/phrases/failure.dart';
import 'package:todaygoodwords/view/widget/phrases/loading.dart';
import 'package:todaygoodwords/view/widget/phrases/phrase.dart';
import 'package:todaygoodwords/view/widget/share/share.dart';

class PhraseScreen extends StatelessWidget {
  final GlobalKey _phraseKey = GlobalKey();

  final PhraseStateAdapter _phraseStateAdapter;
  final LikeStateAdapter _likeStateAdapter;
  final PhraseImageAdapter _phraseImageAdapter;

  PhraseScreen({
    Key? key,
    required PhraseStateAdapter phraseStateAdapter,
    required LikeStateAdapter likeStateAdapter,
    required PhraseImageAdapter phraseImageAdapter,
  }) : _phraseStateAdapter = phraseStateAdapter,
        _likeStateAdapter = likeStateAdapter,
        _phraseImageAdapter = phraseImageAdapter,
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

          return RepaintBoundary(
            key: _phraseKey,
            child: Stack(
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
                Positioned(
                  top: 20, left: 10,
                  child: ShareButton(
                    sharePhraseImage: () async {
                      final boundary = _phraseKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
                      final image = await boundary.toImage();
                      await _phraseImageAdapter.share(image);
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return LoadingWidget();
      },
    );
  }
}
