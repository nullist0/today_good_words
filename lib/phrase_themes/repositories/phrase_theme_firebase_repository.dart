import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaygoodwords/phrase_themes/phrase_style.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme_repository.dart';
import 'package:todaygoodwords/util/date.dart';

class PhraseThemeFirebaseRepository implements PhraseThemeRepository {
  final DateTime _date;

  PhraseThemeFirebaseRepository(this._date);

  @override
  Stream<PhraseTheme> read() {
    return FirebaseFirestore.instance
        .collection('phrase_themes')
        .doc(_date.toDateString())
        .snapshots()
        .map(_fromDocument);
  }

  PhraseTheme _fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final Map<String, dynamic> data = doc.data() ?? {};
    return PhraseTheme(_fromMap(data['name']), _fromMap(data['text']));
  }

  PhraseStyle _fromMap(Map<String, dynamic> data) {
    final num size = data['size'];
    final String colorCode = data['color'];
    return PhraseStyle(size.toDouble(), Color(int.parse(colorCode, radix:16)));
  }
}