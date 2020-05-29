import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: OrientationBuilder(builder:
              (context, orientation){
            if(orientation == Orientation.landscape)
              return Text('land');
            else
              return Text('port');
          })
        ),
      ),
    );
  }
}