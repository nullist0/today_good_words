import 'dart:async';
import 'dart:developer';
import 'package:bloc/phrases/phrase_state.dart';
import 'package:bloc/phrases/phrase_state_bloc.dart';
import 'package:domain/phrases/phrase_theme.dart';
import 'package:rxdart/rxdart.dart';
import 'package:domain/phrases/phrase.dart';
import 'package:domain/phrases/phrase_repository.dart';
import 'package:domain/phrases/phrase_theme_repository.dart';

class PhraseStateNativeBloc implements PhraseStateBloc {
  final PhraseRepository _phraseRepository;
  final PhraseThemeRepository _phraseThemeRepository;

  PhraseStateNativeBloc(this._phraseRepository, this._phraseThemeRepository);

  @override
  Stream<PhraseState> states() {
    var phrases = _phraseRepository.read();
    var phraseThemes = _phraseThemeRepository.read();

    return CombineLatestStream.combine2(
      phrases,
      phraseThemes,
      (Phrase phrase, PhraseTheme theme) => PhraseState(phrase, theme),
    ).doOnError((exception, stacktrace) { log(exception.toString(), stackTrace: stacktrace); });
  }
}