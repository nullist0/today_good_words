import 'package:domain/phrase_images/phrase_image.dart';

abstract class PhraseImageBloc {
  Future<void> share(final PhraseImage image);
}
