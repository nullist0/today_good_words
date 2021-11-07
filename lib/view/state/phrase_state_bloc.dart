import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme_repository.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/phrases/phrase_repository.dart';
import 'package:todaygoodwords/view/state/phrase_state.dart';

class PhraseStateBloc {
  final PhraseRepository _phraseRepository;
  final PhraseThemeRepository _phraseThemeRepository;

  PhraseStateBloc(this._phraseRepository, this._phraseThemeRepository);

  Stream<PhraseState> states() {
    var phrases = _phraseRepository.read();
    var phraseThemes = _phraseThemeRepository.read();
    return CombineLatestStream.combine2(phrases, phraseThemes,
            (Phrase phrase, PhraseTheme theme) => PhraseState(phrase, theme)
    );
  }
}