import 'package:todaygoodwords/likes/like_repository.dart';

class LikeStateBloc {
  final LikeRepository _likeRepository;

  LikeStateBloc(LikeRepository likeRepository)
      : _likeRepository = likeRepository;

}