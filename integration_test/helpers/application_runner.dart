import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todaygoodwords/likes/like.dart';
import 'package:todaygoodwords/phrase_themes/phrase_theme.dart';
import 'package:todaygoodwords/phrases/phrase.dart';
import 'package:todaygoodwords/main.dart' as app;

DateTime currentWithoutData = DateTime(1990, 1, 1);
DateTime currentWithData = DateTime(2006, 10, 1);

class ApplicationRunner {
  Future<void> startTestFirebase() async {
    await Firebase.initializeApp();
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  Future<void> startApp(final WidgetTester tester, [DateTime? current]) async {
    await app.main(current != null ? <String>[current.toString()] : <String>[]);

    await tester.pumpAndSettle();
    await tester.idle();
    await tester.pumpAndSettle();
  }

  void displayLoading() {
    expect(find.text('불러오는 중입니다.'), findsOneWidget);
  }

  void displayPhrase(final WidgetTester tester, final Phrase phrase, final PhraseTheme phraseTheme) {
    final nameFinder = find.text(phrase.name);
    final textFinder = find.textContaining(phrase.text);

    expect(nameFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);

    var name = tester.firstWidget(nameFinder) as Text;
    var text = tester.firstWidget(textFinder) as Text;

    expect(name.style?.fontSize, phraseTheme.name.size);
    expect(text.style?.fontSize, phraseTheme.text.size);

    expect(name.style?.color, phraseTheme.name.color);
    expect(text.style?.color, phraseTheme.text.color);
  }

  void displayFailure() {
    expect(find.text('불러오는데 실패했습니다.'), findsOneWidget);
  }

  Finder _likeWidgetFinder() => find.bySemanticsLabel(RegExp(r'Like'));

  void displayLike(final Like like) {
    expect(_likeWidgetFinder(), findsOneWidget);
    expect(find.text(like.count.toString()), findsOneWidget);
  }

  void notDisplayLike() {
    expect(_likeWidgetFinder(), findsNothing);
  }

  Future<void> switchLike(final WidgetTester tester) async {
    await tester.tap(_likeWidgetFinder());
    await tester.idle();
    await tester.pumpAndSettle();
  }
}