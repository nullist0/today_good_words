import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onTap;

  const ShareButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ButtonTheme(
      minWidth: 30,
      height: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: FlatButton(
        child: Text('S',style: TextStyle(color: Colors.white)),
        padding: EdgeInsets.zero,
        color: Colors.blue,
        onPressed: onTap,
      )
    );
  }
}
