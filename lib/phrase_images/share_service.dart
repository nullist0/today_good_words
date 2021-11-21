import 'package:todaygoodwords/phrase_images/phrase_image.dart';

abstract class ShareService {
  Future<void> share(PhraseImage image);
}