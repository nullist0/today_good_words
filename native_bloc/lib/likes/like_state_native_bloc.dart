import 'package:bloc/likes/like_state_bloc.dart';
import 'package:domain/likes/like_repository.dart';
import 'package:bloc/likes/like_state.dart';

class LikeStateNativeBloc implements LikeStateBloc {
  final LikeRepository _likeRepository;

  LikeStateNativeBloc(LikeRepository likeRepository)
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