import 'package:domain/phrases/phrase_style.dart';

class PhraseTheme {
  final PhraseStyle name;
  final PhraseStyle text;

  PhraseTheme(this.name, this.text);

  PhraseTheme.fromJson(Map<String, dynamic> json)
      : name = PhraseStyle.fromJson(json['name']),
        text = PhraseStyle.fromJson(json['text']);

  Map<String, dynamic> toJson() {
    return {
      'name': name.toJson(),
      'text': text.toJson()
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is PhraseTheme) {
      return name == other.name && text == other.text;
    }
    return super == other;
  }

  @override
  int get hashCode => Object.hash(name, text);

}