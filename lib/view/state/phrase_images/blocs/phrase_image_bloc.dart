import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todaygoodwords/phrase_images/phrase_image.dart';
import 'package:todaygoodwords/phrase_images/share_service.dart';
import 'package:todaygoodwords/view/state/phrase_images/phrase_image_adapter.dart';

class PhraseImageBloc implements PhraseImageAdapter {
  final ShareService _shareService;

  PhraseImageBloc(this._shareService);

  @override
  Future<void> share(GlobalKey key) async {
    RenderRepaintBoundary? boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    ui.Image? image = await boundary?.toImage();
    ByteData? byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();

    if (pngBytes != null) {
      await _shareService.share(PhraseImage(pngBytes));
    }
  }
}