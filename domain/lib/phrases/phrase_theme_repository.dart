import 'package:domain/phrases/phrase_theme.dart';

abstract class PhraseThemeRepository {
  Stream<PhraseTheme> read();
}