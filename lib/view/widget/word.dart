import 'package:flutter/material.dart';
import 'package:todaygoodwords/phrases//full_word.dart';
import 'package:todaygoodwords/view/widget/date.dart';
import 'package:todaygoodwords/view/widget/logo.dart';

///Word Component = wordContainer + logo + date
class WordWidget extends StatelessWidget {
  final Word saying;

  const WordWidget({Key? key, required this.saying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text('\"${saying.word.text}\"',
                      textAlign: TextAlign.center,
                      style: saying.word.style
                  ),
                ),
                Text(saying.name.text,
                    style: saying.name.style
                )
              ],
            ),
          ),
          color: saying.background.color,
        ),
        Positioned(
          top:5, right: 5,
          child: DateWidget(date: saying.date),
        ),
        Positioned(
          bottom: 5, right: 5,
          child: LogoText(),
        )
      ],
    );
  }
}