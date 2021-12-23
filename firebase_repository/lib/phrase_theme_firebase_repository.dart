import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/date_strings/date_string.dart';
import 'package:domain/phrases/phrase_theme.dart';
import 'package:domain/phrases/phrase_theme_repository.dart';

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
    return PhraseTheme.fromJson(data);
  }
}