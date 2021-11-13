import 'package:flutter/material.dart';
import 'package:todaygoodwords/phrase_themes/phrase_style.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrases/phrase.dart';

extension _ToTextStyle on PhraseStyle {
  TextStyle toTextStyle() {
    return TextStyle(
        color: color,
        fontSize: size
    );
  }
}

class PhraseState {
  final String text, name;
  final TextStyle textStyle, nameStyle;

  PhraseState(final Phrase phrase, final PhraseTheme theme)
      : text = '"${phrase.text}"',
        name = phrase.name,
        textStyle = theme.text.toTextStyle(),
        nameStyle = theme.name.toTextStyle();
}