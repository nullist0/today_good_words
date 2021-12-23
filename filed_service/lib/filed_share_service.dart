import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:domain/phrase_images/phrase_image.dart';
import 'package:domain/phrase_images/share_service.dart';

class FiledShareService implements ShareService {
  @override
  Future<void> share(PhraseImage image) async {
    final Directory tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/phrase.png');

    await file.create();
    await file.writeAsBytes(image.uint8data());
    await Share.shareFiles([file.path]);
  }
}