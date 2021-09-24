import 'dart:async';

import 'package:todaygoodwords/model/data/likes.dart';
import 'package:todaygoodwords/model/data/words.dart';
import 'package:todaygoodwords/model/repository/like_repository.dart';
import 'package:todaygoodwords/model/repository/word_repository.dart';

abstract class WordLandScapeViewModel {
  Stream<Word> get word;
  Stream<Like> get like;

  Future<void> sendLike();

  void dispose();
}

class WordLandScapeViewModelImpl implements WordLandScapeViewModel {
  final String _uid;

  final StreamController<Like> _likeController = StreamController.broadcast();
  final StreamController<Word> _wordController = StreamController.broadcast();

  LikeRepository _likeRepository;
  WordRepository _wordRepository;

  WordLandScapeViewModelImpl(this._uid)
    : _likeRepository = LikeRepositoryImpl(DateTime.now()),
      _wordRepository = WordRepositoryImpl(DateTime.now()) {

    _wordController.addStream(_wordRepository.read());
    _likeController.addStream(_likeRepository.read(_uid));
  }

  @override
  void dispose() {
    _likeController.close();
    _wordController.close();
  }

  @override
  Stream<Like> get like => _likeController.stream;

  @override
  Future<void> sendLike() => _likeRepository.like(_uid);

  @override
  Stream<Word> get word => _wordController.stream;

}