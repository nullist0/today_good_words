import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final DateTime date;

  const DateWidget({
    Key? key,
    required this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${date.year}-${date.month ~/ 10}${date.month % 10}-${date.day ~/ 10}${date.day % 10}');
  }
}
