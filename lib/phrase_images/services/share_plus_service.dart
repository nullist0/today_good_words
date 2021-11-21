import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todaygoodwords/phrase_images/phrase_image.dart';
import 'package:todaygoodwords/phrase_images/share_service.dart';

class SharePlusService implements ShareService {
  @override
  Future<void> share(PhraseImage image) async {
    final Directory tempDir = await getTemporaryDirectory();
    final File file = File('$tempDir/phrase.png');

    await file.writeAsBytes(image.data);
    await Share.shareFiles([file.path]);
  }
}