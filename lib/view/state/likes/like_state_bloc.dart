import 'package:todaygoodwords/likes/like_repository.dart';
import 'package:todaygoodwords/view/state/likes/like_state.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';

class LikeStateBloc implements LikeStateAdapter {
  final LikeRepository _likeRepository;

  LikeStateBloc(LikeRepository likeRepository)
      : _likeRepository = likeRepository;

  @override
  Stream<LikeState> states() {
    return _likeRepository.read().map((like) => LikeState(like));
  }

  @override
  Future<void> switchLike() {
    return _likeRepository.like();
  }
}