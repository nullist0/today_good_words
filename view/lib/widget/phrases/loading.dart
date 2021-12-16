import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              '불러오는 중입니다.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 30)
            ),
          ),
          Text(
              '잠시 기다려주세요.',
              style: TextStyle(color: Colors.black, fontSize: 18)
          )
        ],
      ),
    );
  }
}
