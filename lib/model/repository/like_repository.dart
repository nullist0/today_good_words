import 'package:async/async.dart';
import 'package:todaygoodwords/model/data/likes.dart';
import 'package:todaygoodwords/util/date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LikeRepository {
  Stream<Like> read(final String uid);
  Future<void> like(final String uid);
}

class LikeRepositoryImpl implements LikeRepository {
  final DateTime date;
  LikeRepositoryImpl(this.date);

  @override
  Future<void> like(final String uid) {
    return FirebaseFirestore.instance.runTransaction((transaction) {
      final DocumentReference ref = FirebaseFirestore.instance.collection('words/${date.toDateString()}/like').doc(uid);
      return transaction
          .get(ref)
          .then((value) => value.exists)
          .then((value) => value ? ref.delete() : ref.set({}));
    });
  }

  Stream<bool> _isLike(final String uid) => FirebaseFirestore.instance
        .collection('words/${date.toDateString()}/like')
        .doc(uid)
        .snapshots()
        .map((event) => event.exists);

  Stream<int> _likeCount() => FirebaseFirestore.instance
        .collection('words/${date.toDateString()}/like')
        .snapshots()
        .map((event) => event.docs.length);

  @override
  Stream<Like> read(final String uid) {
    return StreamZip([
      _isLike(uid),
      _likeCount()
    ]).map((event) => Like(isLike: event[0] ?? false, likeCount: event[1] ?? 0));
  }
}