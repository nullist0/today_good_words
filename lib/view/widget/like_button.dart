import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/likes.dart';

class LikeButton extends StatelessWidget {
  final Like like;
  final VoidCallback onTap;

  const LikeButton({Key key, this.like, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          like.isLike
              ? Icon(Icons.favorite, size: 30, color: Colors.redAccent)
              : Icon(Icons.favorite_border, size: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('${like.likeCount}',
              style: TextStyle(
                fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }
}
