import 'like.dart';

abstract class LikeRepository {
  Stream<Like> read();
  Future<void> like();
}