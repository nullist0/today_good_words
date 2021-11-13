import 'package:flutter/material.dart';
import 'package:todaygoodwords/view/widget/phrases/failure.dart';
import 'package:todaygoodwords/view/widget/phrases/loading.dart';
import 'package:todaygoodwords/view/widget/phrases/phrase.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state_bloc.dart';

class WordLandscape extends StatefulWidget {
  final PhraseStateBloc _phraseStateBloc;

  const WordLandscape({Key? key, required PhraseStateBloc phraseStateBloc})
      : _phraseStateBloc = phraseStateBloc, super(key: key);

  @override
  _WordLandscapeState createState() => _WordLandscapeState();
}

class _WordLandscapeState extends State<WordLandscape> {
  final GlobalKey _wordWidgetKey = GlobalKey();

  // late WordLandScapeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // final String uid = Provider.of<User>(context).uid;
    // _viewModel = WordLandScapeViewModelImpl(uid);
  }

  @override
  void dispose() {
    super.dispose();
    // _viewModel.dispose();
  }

  Future<void> _share () async {
    // TODO Capture the Widget
    // final RenderObject? boundary = _wordWidgetKey.currentContext.findRenderObject();
    // final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    // final ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // final Uint8List pngByte = byteData.buffer.asUint8List();

    //Share
    // return Share.file('title', 'name.png', pngByte, 'image/png');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<PhraseState>(
          stream: widget._phraseStateBloc.states(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var phraseState = snapshot.data!;
              return PhraseWidget(phraseState: phraseState);
            }
            if (snapshot.hasError) {
              return FailureWidget();
            }
            return LoadingWidget();
          }
        ),
        // Positioned(
        //   top: 20, left: 10,
        //   child: ShareButton(onTap: _share,),
        // ),
        // StreamBuilder<Like>(
        //   stream: _viewModel.like,
        //   builder: (_, snap) {
        //     return Positioned(
        //       bottom: 20, left: 10,
        //       child: LikeButton(like: snap.data ?? Like(), onTap: _viewModel.sendLike,)
        //     );
        //   },
        // ),
      ],
    );
  }
}
