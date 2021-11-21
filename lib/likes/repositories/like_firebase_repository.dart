import 'package:rxdart/streams.dart';
import 'package:todaygoodwords/date_strings/date_string.dart';
import 'package:todaygoodwords/likes/like.dart';
import 'package:todaygoodwords/likes/like_repository.dart';
import 'package:todaygoodwords/users/user_uid.dart';
import 'package:todaygoodwords/users/user_uid_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeFirebaseRepository implements LikeRepository {
  final DateString _date;
  final UserUIDRepository _userUIDRepository;
  final FirebaseFirestore _firestore;
  
  LikeFirebaseRepository(this._date, this._userUIDRepository, this._firestore);

  String get _likeCollectionPath => 'phrases/$_date/like';
  
  @override
  Future<void> like() async {
    var userUID = await _userUIDRepository.readCurrent();
    return _firestore.runTransaction((transaction) {
      final DocumentReference ref = _firestore
        .collection(_likeCollectionPath)
        .doc(userUID.uid);
      return transaction
        .get(ref)
        .then((value) => value.exists)
        .then((value) => value ? ref.delete() : ref.set(<String, dynamic>{}));
    });
  }

  Stream<bool> _isLike(final UserUID userUID) => _firestore
    .collection(_likeCollectionPath)
    .doc(userUID.uid)
    .snapshots()
    .map((event) => event.exists);

  Stream<int> _count() => _firestore
    .collection(_likeCollectionPath)
    .snapshots()
    .map((event) => event.docs.length);

  @override
  Stream<Like> read() {
    return _userUIDRepository
      .read()
      .asyncExpand((userUID) => CombineLatestStream.combine2(
        _isLike(userUID),
        _count(),
          (bool isLiked, int count) => Like(isLiked, count))
      );
  }
}