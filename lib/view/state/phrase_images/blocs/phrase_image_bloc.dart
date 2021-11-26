import 'dart:ui';

import 'package:todaygoodwords/phrase_images/phrase_image.dart';
import 'package:todaygoodwords/phrase_images/share_service.dart';
import 'package:todaygoodwords/view/state/phrase_images/phrase_image_adapter.dart';

class PhraseImageBloc implements PhraseImageAdapter {
  final ShareService _shareService;

  PhraseImageBloc(this._shareService);

  @override
  Future<void> share(final Image image) async {
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData?.buffer.asUint8List();

    if (pngBytes != null) {
      await _shareService.share(PhraseImage(pngBytes));
    }
  }
}