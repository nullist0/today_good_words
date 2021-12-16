import 'package:domain/likes/like.dart';
import 'package:domain/widget_state/base_widget_state.dart';

class LikeState extends BaseWidgetState {
  final bool isLiked;
  final int count;

  LikeState(final Like like): isLiked = like.isLiked, count = like.count;
}