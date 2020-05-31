import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShareButton extends StatelessWidget {
  final GlobalKey wordWidgetKey;

  const ShareButton({Key key, @required this.wordWidgetKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      height: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: FlatButton(
        child: Text('S',style: TextStyle(color: Colors.white)),
        padding: EdgeInsets.zero,
        color: Colors.blue,
        onPressed: () async {
          //Capture the Widget
          RenderRepaintBoundary boundary = wordWidgetKey.currentContext.findRenderObject();
          ui.Image image = await boundary.toImage(pixelRatio: 3.0);
          ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
          Uint8List pngByte = byteData.buffer.asUint8List();

          //Share
          Share.file('title', 'name.png', pngByte, 'image/png');
        },
      )
    );
  }
}
