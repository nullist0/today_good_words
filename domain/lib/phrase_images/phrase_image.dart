import 'dart:typed_data';

class PhraseImage {
  final List<int> data;

  PhraseImage(this.data);

  Uint8List uint8data() => Uint8List.fromList(data);
}