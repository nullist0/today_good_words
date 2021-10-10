import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';

class PhraseBloc {
  final PhraseRepository _phraseRepository;
  PhraseBloc(this._phraseRepository);

  Stream<Phrase> read() => _phraseRepository.read();
}
