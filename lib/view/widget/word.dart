import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/words.dart';

class WordWidget extends StatelessWidget {
  final Word word;
  const WordWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('\"인간은 거짓말 해줘야 하는\n사람을 싫어한다.\"', textAlign: TextAlign.center,),
            ),
            Text('빅토르 위고')
          ],
        ),
      ),
      color: const Color(0xFFF5F5DC),
    );
  }
}
