import 'package:domain/phrases/phrase_style.dart';
import 'package:domain/phrases/phrase_theme.dart';
import 'package:domain/widget_state/base_widget_state.dart';
import 'package:flutter/material.dart';
import 'package:domain/phrases/phrase.dart';

extension _ToTextStyle on PhraseStyle {
  TextStyle toTextStyle() {
    return TextStyle(
        color: color,
        fontSize: size
    );
  }
}

class PhraseState extends BaseWidgetState {
  final String text, name;
  final TextStyle textStyle, nameStyle;

  PhraseState(final Phrase phrase, final PhraseTheme theme)
      : text = '"${phrase.text}"',
        name = phrase.name,
        textStyle = theme.text.toTextStyle(),
        nameStyle = theme.name.toTextStyle();
}