import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todaygoodwords/likes/like.dart';
import 'package:todaygoodwords/likes/like_repository.dart';

import 'fake_like_repository.mocks.dart';

@GenerateMocks([LikeRepository])
extension FakeLikeRepository on LikeRepository {
  static LikeRepository doNothing() {
    var repository = MockLikeRepository();

    when(repository.read()).thenAnswer((_) => Stream.empty());

    return repository;
  }

  static LikeRepository readingOne(final Like like) {
    var repository = MockLikeRepository();

    when(repository.read()).thenAnswer((_) => Stream.value(like));

    return repository;
  }
}
