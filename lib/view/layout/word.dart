import 'package:flutter/material.dart';
import 'package:todaygoodwords/view/state/likes/like_state.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';
import 'package:todaygoodwords/view/widget/likes/like.dart';
import 'package:todaygoodwords/view/widget/phrases/failure.dart';
import 'package:todaygoodwords/view/widget/phrases/loading.dart';
import 'package:todaygoodwords/view/widget/phrases/phrase.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_bloc.dart';

class WordLandscape extends StatefulWidget {
  final PhraseStateBloc _phraseStateBloc;
  final LikeStateAdapter _likeStateAdapter;

  const WordLandscape({Key? key, required PhraseStateBloc phraseStateBloc, required LikeStateAdapter likeStateAdapter})
      : _phraseStateBloc = phraseStateBloc, _likeStateAdapter = likeStateAdapter, super(key: key);

  @override
  _WordLandscapeState createState() => _WordLandscapeState();
}

class _WordLandscapeState extends State<WordLandscape> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PhraseState>(
      stream: widget._phraseStateBloc.states(),
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return FailureWidget();
        }
        if (snapshot.hasData) {
          var phraseState = snapshot.data!;
          return Stack(
            children: <Widget>[
              PhraseWidget(phraseState: phraseState),
              StreamBuilder<LikeState>(
                stream: widget._likeStateAdapter.states(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    var likeState = snap.data!;
                    return Positioned(
                        bottom: 20, left: 10,
                        child: LikeWidget(
                          likeState: likeState,
                          switchLike: widget._likeStateAdapter.switchLike,
                        )
                    );
                  }
                  else {
                    return Container();
                  }
                },
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
