import 'package:mockito/annotations.dart';
import 'package:todaygoodwords/view/state/phrase_images/phrase_image_adapter.dart';

import 'fake_phrase_image_adapter.mocks.dart';

@GenerateMocks([PhraseImageAdapter])
extension FakePhraseImageAdapter on PhraseImageAdapter {
  static PhraseImageAdapter fake() => MockPhraseImageAdapter();
}