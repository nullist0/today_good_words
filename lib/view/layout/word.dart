import 'package:flutter/material.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_bloc.dart';
import 'package:todaygoodwords/view/widget/loading.dart';
import 'package:todaygoodwords/view/widget/phrase.dart';

class WordLandscape extends StatefulWidget {
  final PhraseBloc _phraseBloc;

  const WordLandscape({Key? key, required PhraseBloc phraseBloc})
      : _phraseBloc = phraseBloc, super(key: key);

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
        StreamBuilder<Phrase>(
          stream: widget._phraseBloc.read(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var phrase = snapshot.data!;
              return PhraseWidget(phrase: phrase);
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
