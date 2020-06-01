import 'package:flutter/material.dart';
import 'package:todaygoodwords/model/data/likes.dart';
import 'package:todaygoodwords/model/helper/like_helper.dart';
import 'package:todaygoodwords/model/inherited_widget/user_inherited_widget.dart';

class LikeButton extends StatefulWidget {
  final WordLike like;
  final DateTime date;

  const LikeButton({Key key, this.like, this.date}) : super(key: key);
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.like.isLike = !widget.like.isLike;
          widget.like.likes += (widget.like.isLike) ? 1 : -1;
        });

        LikeFirebaseHelper(date: widget.date).like(UserInheritedWidget.of(context), widget.like.isLike);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _like(widget.like.isLike),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('${widget.like.likes}',
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
