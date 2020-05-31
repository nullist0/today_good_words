import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;
  int likedNumber = 10;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _like(isLiked),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('$likedNumber',
              style: TextStyle(
                fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _like(bool isLiked){
    if(isLiked)
      return Icon(Icons.favorite, size: 30, color: Colors.redAccent);
    else
      return Icon(Icons.favorite_border, size: 30,);
  }
}
