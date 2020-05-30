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
    return Ink(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent,
      ),
      child: InkWell(
        child: Center(child: Text('S', style: TextStyle(color: Colors.white),)),
        onTap: () async {
          RenderRepaintBoundary boundary = wordWidgetKey.currentContext.findRenderObject();
          ui.Image image = await boundary.toImage();
          ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
          Uint8List pngByte = byteData.buffer.asUint8List();
          Share.file('title', 'name.png', pngByte, 'image/png');
        },
        customBorder: CircleBorder(),
      ),
    );
  }
}
