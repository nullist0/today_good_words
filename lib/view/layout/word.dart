import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todaygoodwords/model/data/likes.dart';
import 'package:todaygoodwords/model/data/users.dart';
import 'package:todaygoodwords/model/data/words.dart';
import 'package:todaygoodwords/view/widget/like_button.dart';
import 'package:todaygoodwords/view/widget/share.dart';
import 'package:todaygoodwords/view/widget/word.dart';
import 'package:todaygoodwords/view_model/word_view_model.dart';

class WordLandscape extends StatefulWidget {
  @override
  _WordLandscapeState createState() => _WordLandscapeState();
}

class _WordLandscapeState extends State<WordLandscape> {
  final GlobalKey _wordWidgetKey = GlobalKey();

  WordLandScapeViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String uid = Provider.of<User>(context).uid;
    _viewModel = WordLandScapeViewModelImpl(uid);
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  Future<void> _share () async {
    //Capture the Widget
    final RenderRepaintBoundary boundary = _wordWidgetKey.currentContext.findRenderObject();
    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngByte = byteData.buffer.asUint8List();

    //Share
    return Share.file('title', 'name.png', pngByte, 'image/png');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder<Word>(
          stream: _viewModel.word,
          builder: (context, snapshot) {
            return RepaintBoundary(
              key: _wordWidgetKey,
              child: WordWidget(saying: snapshot.data),
            );
          }
        ),
        Positioned(
          top: 20, left: 10,
          child: ShareButton(onTap: _share,),
        ),
        StreamBuilder<Like>(
          stream: _viewModel.like,
          builder: (_, snap) {
            return Positioned(
              bottom: 20, left: 10,
              child: LikeButton(like: snap.data, onTap: _viewModel.sendLike,)
            );
          },
        ),
      ],
    );
  }
}
