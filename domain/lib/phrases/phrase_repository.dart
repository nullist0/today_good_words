import 'package:domain/phrases/phrase.dart';

abstract class PhraseRepository {
  Stream<Phrase> read();
}