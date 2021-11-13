import 'package:todaygoodwords/view/state/likes/like_state.dart';

abstract class LikeStateAdapter {
  Stream<LikeState> states();
  Future<void> switchLike();
}