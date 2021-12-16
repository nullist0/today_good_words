import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
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
                '불러오는데 실패했습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 30)
            ),
          ),
          Text(
              '잠시 후에 다시 접속해주세요.',
              style: TextStyle(color: Colors.black, fontSize: 18)
          )
        ],
      ),
    );
  }
}
