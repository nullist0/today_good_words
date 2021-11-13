import 'package:async/async.dart';
import 'package:todaygoodwords/likes/like.dart';
import 'package:todaygoodwords/likes/like_repository.dart';
import 'package:todaygoodwords/users/user_uid.dart';
import 'package:todaygoodwords/users/user_uid_repository.dart';
import 'package:todaygoodwords/util/date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeFirebaseRepository implements LikeRepository {
  final DateTime date;
  final UserUIDRepository userUIDRepository;
  LikeFirebaseRepository(this.date, this.userUIDRepository);

  @override
  Future<void> like() async {
    var userUID = await userUIDRepository.readCurrent();
    return FirebaseFirestore
        .instance
        .runTransaction((transaction) {
      final DocumentReference ref = FirebaseFirestore
          .instance
          .collection('phrases/${date.toDateString()}/like')
          .doc(userUID.uid);
      return transaction
          .get(ref)
          .then((value) => value.exists)
          .then((value) => value ? ref.delete() : ref.set({}));
    });
  }

  Stream<bool> _isLike(final UserUID userUID) => FirebaseFirestore
        .instance
        .collection('phrases/${date.toDateString()}/like')
        .doc(userUID.uid)
        .snapshots()
        .map((event) => event.exists);

  Stream<int> _count() => FirebaseFirestore
        .instance
        .collection('phrases/${date.toDateString()}/like')
        .snapshots()
        .map((event) => event.docs.length);

  @override
  Stream<Like> read() {
    return userUIDRepository
        .read()
        .asyncExpand((userUID) => StreamZip([
          _isLike(userUID),
          _count()
        ])
        .map((event) => Like(event[0] as bool, event[1] as int)));
  }
}