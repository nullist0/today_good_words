import 'package:todaygoodwords/shares/image.dart';

abstract class ShareAdapter {
  Future<void> share(PhraseImage image);
}