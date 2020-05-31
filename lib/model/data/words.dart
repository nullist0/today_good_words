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

  Word({
    this.word,
    this.name,
    this.background,
    this.like,
    this.date
  });

  static Word fromSnapShot(DocumentSnapshot snapshot){
    return null;
  }
}