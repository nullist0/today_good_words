import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WordText{
  final String text;
  final TextStyle style;
  WordText({
    required this.text,
    required this.style
  });
}

class WordBackground{
  final Color color;
  WordBackground({
    required this.color
  });
}

class Word{
  final WordText word, name;
  final WordBackground background;
  final DateTime date;
  final EdgeInsets betweenWordAndName;

  Word({
    required this.word,
    required this.name,
    required this.background,
    required this.date,
    required this.betweenWordAndName
  });

  Word.createWord(String text, String name, this.date)
      : word = WordText(
          text: text,
          style: TextStyle(color: Colors.black, fontSize: 30)
        ),
        name = WordText(
          text: name,
          style: TextStyle(color: Colors.black, fontSize: 18)
        ),
        background = WordBackground(color: Color(0xFFF5F5DC)),
        betweenWordAndName= EdgeInsets.only(bottom: 40);

  static Word loadWord(DateTime date) => Word.createWord('불러오는 중입니다.', '잠시 기다려주세요.', date);
  static Word failedWord(DateTime date) => Word.createWord('불러오기 실패했습니다.', '잠시 후에 다시 접속해주세요.', date);
}