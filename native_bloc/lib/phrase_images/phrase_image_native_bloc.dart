import 'package:domain/phrase_images/phrase_image.dart';
import 'package:domain/phrase_images/phrase_image_bloc.dart';
import 'package:domain/phrase_images/share_service.dart';

class PhraseImageNativeBloc implements PhraseImageBloc {
  final ShareService _shareService;

  PhraseImageNativeBloc(this._shareService);

  @override
  Future<void> share(PhraseImage image) {
    return _shareService.share(image);
  }
}