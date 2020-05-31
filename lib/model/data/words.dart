import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

class WordLike{
  bool isLike;
  int likes;

  WordLike({
    this.isLike = false,
    this.likes = 0
  });
}

class Word{
  final WordText word, name;
  final WordBackground background;
  final WordLike like;
  final DateTime date;
  final EdgeInsets betweenWordAndName;

  Word({
    this.word,
    this.name,
    this.background,
    this.like,
    this.date,
    this.betweenWordAndName
  });

  static Word fromSnapShot(DateTime date, DocumentSnapshot data){
    WordText word = WordText(
      text: data['text'],
      style: TextStyle(
        color: Color(int.parse(data['textColor'])),
        fontSize: data['textSize'],
        fontFamily: data['textFont'],
      )
    );
    WordText name = WordText(
      text: data['name'],
      style: TextStyle(
        color: Color(int.parse(data['nameColor'])),
        fontSize: data['nameSize'],
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
      betweenWordAndName: EdgeInsets.only(bottom: data['padding'])
    );
  }
}