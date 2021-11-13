import 'package:todaygoodwords/likes/like.dart';

class LikeState {
  final bool isLiked;
  final int count;

  LikeState(final Like like): isLiked = like.isLiked, count = like.count;
}