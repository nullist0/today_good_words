import 'package:flutter/material.dart';
import 'package:todaygoodwords/view/state/phrases/phrase_state.dart';

class PhraseWidget extends StatelessWidget {
  final PhraseState _phraseState;

  const PhraseWidget({Key? key, required PhraseState phraseState})
      : _phraseState = phraseState, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(_phraseState.text,
                textAlign: TextAlign.center,
                style: _phraseState.textStyle,
              ),
            ),
            Text(_phraseState.name,
              style: _phraseState.nameStyle,
            ),
          ],
        ),
      ),
    );
  }
}
