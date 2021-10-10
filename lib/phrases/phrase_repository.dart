import 'package:todaygoodwords/phrases/phrase.dart';

abstract class PhraseRepository {
  Stream<Phrase> read();
}