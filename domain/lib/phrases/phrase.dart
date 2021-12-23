class Phrase {
  final String name, text;

  Phrase(this.name, this.text);

  Phrase.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        text = json['text'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'text': text
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is Phrase) {
      return name == other.name && text == other.text;
    }
    return super == other;
  }

  @override
  int get hashCode => Object.hash(name, text);
}