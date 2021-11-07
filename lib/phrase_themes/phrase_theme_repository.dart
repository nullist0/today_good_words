import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';

abstract class PhraseThemeRepository {
  Stream<PhraseTheme> read();
}