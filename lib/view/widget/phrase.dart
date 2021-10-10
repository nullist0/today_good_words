import 'package:flutter/material.dart';
import 'package:todaygoodwords/phrases/phrase.dart';

class PhraseWidget extends StatelessWidget {
  final Phrase _phrase;

  const PhraseWidget({Key? key, required Phrase phrase})
      : _phrase = phrase, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('\"${_phrase.text}\"',
                  textAlign: TextAlign.center,
              ),
            ),
            Text(_phrase.name)
          ],
        ),
      ),
    );
  }
}
