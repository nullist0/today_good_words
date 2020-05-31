import 'package:flutter/material.dart';
import 'package:todaygoodwords/view/widget/date.dart';
import 'package:todaygoodwords/view/widget/logo.dart';

///Word Component = wordContainer + logo + date
class WordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _wordContainer(),
        Positioned(
          top:5, right: 5,
          child: DateWidget(date: DateTime.now()),
        ),
        Positioned(
          bottom: 5, right: 5,
          child: LogoText(),
        )
      ],
    );
  }

  Widget _wordContainer() {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('\"인간은 거짓말 해줘야 하는\n사람을 싫어한다.\"',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'RobotoMono'
                ),
              ),
            ),
            Text('빅토르 위고',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'RobotoMono'
              ),
            )
          ],
        ),
      ),
      color: const Color(0xFFF5F5DC),
    );
  }
}
