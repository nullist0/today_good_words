import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:domain/phrase_images/phrase_image.dart';
import 'package:domain/phrase_images/share_service.dart';
import 'package:mockito/mockito.dart';
import 'package:native_bloc/phrase_images/phrase_image_native_bloc.dart';
import 'phrase_image_native_bloc_test.mocks.dart';

@GenerateMocks([ShareService])
void main() {
  late PhraseImageNativeBloc bloc;
  late ShareService service;

  setUp(() {
    service = MockShareService();
    bloc = PhraseImageNativeBloc(service);
  });

  test('phrase image native bloc should call share of the share service.', () {
    // given
    final PhraseImage phraseImage = PhraseImage([]);

    // when
    bloc.share(phraseImage);

    // then
    verify(service.share(phraseImage));
  });
}
