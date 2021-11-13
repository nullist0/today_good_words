import 'package:flutter/material.dart';
import 'package:todaygoodwords/view/state/likes/like_state.dart';

class LikeWidget extends StatelessWidget {
  final LikeState likeState;
  final VoidCallback switchLike;

  const LikeWidget({Key? key, required this.likeState, required this.switchLike}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Like',
      child: InkWell(
        onTap: switchLike,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            likeState.isLiked
                ? Icon(Icons.favorite, size: 30, color: Colors.redAccent)
                : Icon(Icons.favorite_border, size: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text('${likeState.count}',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
