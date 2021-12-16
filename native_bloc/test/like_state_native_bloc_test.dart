import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:domain/likes/like_repository.dart';
import 'package:native_bloc/likes/like_state_native_bloc.dart';

import 'like_state_native_bloc_test.mocks.dart';

@GenerateMocks([LikeRepository])
void main() {
  late LikeRepository likeRepository;
  late LikeStateNativeBloc likeStateBloc;

  setUp(() {
    likeRepository = MockLikeRepository();
    likeStateBloc = LikeStateNativeBloc(likeRepository);
  });

  test('like state bloc states() must call repository read()', () {
    // given
    when(likeRepository.read()).thenAnswer((_) => const Stream.empty());

    // when
    likeStateBloc.states();

    // then
    verify(likeRepository.read());
  });

  test('like state bloc switchLike() must call repository like()', () {
    // given
    // when
    likeStateBloc.switchLike();

    // then
    verify(likeRepository.like());
  });
}