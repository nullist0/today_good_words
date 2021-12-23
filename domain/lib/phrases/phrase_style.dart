import 'dart:ui';

class PhraseStyle {
  final double size;
  final Color color;

  PhraseStyle(this.size, this.color);

  PhraseStyle.fromJson(Map<String, dynamic> json)
      : size = json['size'].toDouble(),
        color = Color(int.parse(json['color'], radix:16));

  Map<String, dynamic> toJson() {
    return {
      'size': size.toInt(),
      'color': color.value.toRadixString(16)
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is PhraseStyle) {
      return size == other.size && color == other.color;
    }
    return super == other;
  }

  @override
  int get hashCode => Object.hash(size, color);

}