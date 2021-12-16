import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:domain/users/user_uid.dart';
import 'package:domain/users/user_uid_repository.dart';

class UserUIDFirebaseRepository implements UserUIDRepository {
  final FirebaseAuth _firebaseAuth;

  UserUIDFirebaseRepository(this._firebaseAuth);

  @override
  Stream<UserUID> read() {
    if (_firebaseAuth.currentUser == null) login();
    return _firebaseAuth.userChanges().map((event) => UserUID(event?.uid ?? ""));
  }

  @override
  Future<UserUID> readCurrent() async {
    if (_firebaseAuth.currentUser == null) await login();
    var user = _firebaseAuth.currentUser;
    return UserUID(user?.uid ?? '');
  }

  @override
  Future<void> login() {
    return _firebaseAuth.signInAnonymously();
  }
}