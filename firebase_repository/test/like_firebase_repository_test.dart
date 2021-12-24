import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/date_strings/date_string.dart';
import 'package:domain/likes/like.dart';
import 'package:domain/users/user_uid.dart';
import 'package:domain/users/user_uid_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_repository/like_firebase_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'like_firebase_repository_test.mocks.dart';

extension LikeFakeFirestore on FirebaseFirestore {
  String _likePath(DateString dateString) => 'phrases/$dateString/like';

  Future<void> putLike(DateString dateString, UserUID userUID) {
    return collection(_likePath(dateString))
        .doc(userUID.uid)
        .set(<String, dynamic>{});
  }

  Future<Like> getLike(DateString dateString, UserUID userUID, Like like) async {
    final isLiked = await collection(_likePath(dateString))
        .doc(userUID.uid)
        .get()
        .then((value) => value.exists);
    final count = await collection(_likePath(dateString))
        .get()
        .then((value) => value.docs.length);

    return Like(isLiked, count);
  }
}

@GenerateMocks([UserUIDRepository])
void main() {
  late UserUID userUID;
  late DateString dateString;
  late UserUIDRepository userUIDRepository;
  late FirebaseFirestore firebaseFirestore;
  late LikeFirebaseRepository likeFirebaseRepository;

  setUp(() {
    userUID = UserUID('test-uid');
    dateString = DateString(DateTime.now());
    userUIDRepository = MockUserUIDRepository();
    firebaseFirestore = FakeFirebaseFirestore();
    likeFirebaseRepository = LikeFirebaseRepository(dateString, userUIDRepository, firebaseFirestore);
  });

  test('like firebase repository reads 0 like if no body liked.', () {
    // given
    final Like zeroLike = Like(false, 0);
    when(userUIDRepository.read()).thenAnswer((_) => Stream.value(userUID));
    when(userUIDRepository.readCurrent()).thenAnswer((_) => Future.value(userUID));

    // when

    // then
    final likeStream = likeFirebaseRepository.read();
    expectLater(likeStream, emits(zeroLike));
  });

  test('like firebase repository reads 1 like if you liked', () async {
    // given
    final Like youLiked = Like(true, 1);
    when(userUIDRepository.read()).thenAnswer((_) => Stream.value(userUID));
    when(userUIDRepository.readCurrent()).thenAnswer((_) => Future.value(userUID));

    // when
    await likeFirebaseRepository.like();

    // then
    final likeStream = likeFirebaseRepository.read();
    expectLater(likeStream, emits(youLiked));
  });

  test('like firebase repository reads 1 like if other liked', () async {
    // given
    final UserUID otherUID = UserUID('other-uid');
    final Like otherLiked = Like(false, 1);
    when(userUIDRepository.read()).thenAnswer((_) => Stream.value(userUID));
    when(userUIDRepository.readCurrent()).thenAnswer((_) => Future.value(userUID));

    // when
    await firebaseFirestore.putLike(dateString, otherUID);

    // then
    final likeStream = likeFirebaseRepository.read();
    expectLater(likeStream, emits(otherLiked));
  });
}