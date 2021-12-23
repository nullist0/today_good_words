import 'dart:developer';

import 'package:bloc/likes/like_state.dart';
import 'package:bloc/likes/like_state_bloc.dart';
import 'package:bloc/phrases/phrase_state.dart';
import 'package:bloc/phrases/phrase_state_bloc.dart';
import 'package:domain/phrase_images/phrase_image_bloc.dart';
import 'package:domain/phrase_images/phrase_image.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:view/state/phrase_screen_state.dart';
import 'package:view/widget/common/screenshotable.dart';
import 'package:view/widget/likes/like.dart';
import 'package:view/widget/phrases/failure.dart';
import 'package:view/widget/phrases/loading.dart';
import 'package:view/widget/phrases/phrase.dart';
import 'package:view/widget/share/share.dart';

class PhraseScreen extends StatelessWidget {
  final ScreenshotController _screenshotController = ScreenshotController();
  
  final PhraseStateBloc _phraseStateBloc;
  final LikeStateBloc _likeStateBloc;
  final PhraseImageBloc _phraseImageBloc;

  PhraseScreen({
    Key? key,
    required PhraseStateBloc phraseStateBloc,
    required LikeStateBloc likeStateBloc,
    required PhraseImageBloc phraseImageBloc,
  }) : _phraseStateBloc = phraseStateBloc,
        _likeStateBloc = likeStateBloc,
        _phraseImageBloc = phraseImageBloc,
        super(key: key);

  Future<void> _share() async {
    final image = await _screenshotController.takeScreenshot();
    final byteData = await image.toByteData();
    if (byteData != null) {
      final data = byteData.buffer.asUint8List().toList();
      final phraseImage = PhraseImage(data);
      await _phraseImageBloc.share(phraseImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PhraseScreenState>(
      stream: CombineLatestStream.combine2(
          _phraseStateBloc.states(),
          _likeStateBloc.states(),
          (PhraseState phraseState, LikeState likeState) =>
              PhraseScreenState(phraseState, likeState)
      ),
      builder: (_, stateSnapshot) {
        if (stateSnapshot.hasError) {
          log(stateSnapshot.error.toString());
          return const FailureWidget();
        }
        if (stateSnapshot.hasData) {
          var screenState = stateSnapshot.data!;
          var phraseState = screenState.phraseState;
          var likeState = screenState.likeState;

          return Screenshotable(
            controller: _screenshotController,
            child: Stack(
              children: <Widget>[
                PhraseWidget(
                  phraseState: phraseState
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: LikeWidget(
                    likeState: likeState,
                    switchLike: _likeStateBloc.switchLike,
                  ),
                ),
                Positioned(
                  top: 20, left: 10,
                  child: ShareButton(
                    sharePhraseImage: _share,
                  ),
                ),
              ],
            ),
          );
        }
        return const LoadingWidget();
      },
    );
  }
}
