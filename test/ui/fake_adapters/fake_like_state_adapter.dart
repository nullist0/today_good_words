import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todaygoodwords/view/state/likes/like_state.dart';
import 'package:todaygoodwords/view/state/likes/like_state_adapter.dart';

import 'fake_like_state_adapter.mocks.dart';

@GenerateMocks([LikeStateAdapter])
extension FakeLikeStateAdapter on LikeStateAdapter {
  static LikeStateAdapter doNothing() {
    var repository = MockLikeStateAdapter();

    when(repository.states()).thenAnswer((_) => Stream.empty());

    return repository;
  }

  static LikeStateAdapter hasData(final LikeState likeState) {
    var repository = MockLikeStateAdapter();

    when(repository.states()).thenAnswer((_) => Stream.value(likeState));

    return repository;
  }
}