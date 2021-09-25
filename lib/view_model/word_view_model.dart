import 'dart:async';

import 'package:todaygoodwords/model/data/likes.dart';
import 'package:todaygoodwords/model/repository/like_repository.dart';

abstract class WordLandScapeViewModel {
  Stream<Like> get like;

  Future<void> sendLike();
  void dispose();
}

class WordLandScapeViewModelImpl implements WordLandScapeViewModel {
  final String _uid;

  final StreamController<Like> _likeController = StreamController.broadcast();

  LikeRepository _likeRepository;

  WordLandScapeViewModelImpl(this._uid)
    : _likeRepository = LikeRepositoryImpl(DateTime.now()) {
    _likeController.addStream(_likeRepository.read(_uid));
  }

  @override
  void dispose() {
    _likeController.close();
  }

  @override
  Stream<Like> get like => _likeController.stream;

  @override
  Future<void> sendLike() => _likeRepository.like(_uid);
}