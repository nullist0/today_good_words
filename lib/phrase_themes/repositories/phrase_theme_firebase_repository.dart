import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todaygoodwords/date_strings/date_string.dart';
import 'package:todaygoodwords/phrase_themes/phrase_style.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme_repository.dart';

class PhraseThemeFirebaseRepository implements PhraseThemeRepository {
  final DateString _date;
  final FirebaseFirestore _firestore;

  PhraseThemeFirebaseRepository(this._date, this._firestore);

  String get _phraseThemeCollectionPath => 'phrase_themes';
  String get _phraseThemeDocumentPath => _date.toString();
  
  @override
  Stream<PhraseTheme> read() {
    return _firestore
        .collection(_phraseThemeCollectionPath)
        .doc(_phraseThemeDocumentPath)
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