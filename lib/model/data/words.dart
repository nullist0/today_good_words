import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WordText{
  final String text;
  final TextStyle style;
  WordText({
    this.text,
    this.style
  });
}

class WordBackground{
  final Color color;
  WordBackground({
    this.color
  });
}

class Word{
  final WordText word, name;
  final WordBackground background;
  final DateTime date;
  final EdgeInsets betweenWordAndName;

  Word({
    this.word,
    this.name,
    this.background,
    this.date,
    this.betweenWordAndName
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

  static Word fromSnapshot(DateTime date, DocumentSnapshot data){
    WordText word = WordText(
      text: (data['text'] as String).replaceAll('\\n', '\n'),
      style: TextStyle(
        color: Color(int.parse(data['textColor'])),
        fontSize: (data['textSize'] as int).toDouble(),
        fontFamily: data['textFont'],
      )
    );
    WordText name = WordText(
      text: data['name'],
      style: TextStyle(
        color: Color(int.parse(data['nameColor'])),
        fontSize: (data['nameSize'] as int).toDouble(),
        fontFamily: data['nameFont'],
      )
    );
    WordBackground back = WordBackground(
      color: Color(int.parse(data['backgroundColor']))
    );
    return Word(
      word: word,
      name: name,
      background: back,
      date: date,
      betweenWordAndName: EdgeInsets.only(bottom: (data['padding'] as int).toDouble())
    );
  }
}