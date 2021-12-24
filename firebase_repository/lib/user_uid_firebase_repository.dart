import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:domain/users/user_uid.dart';
import 'package:domain/users/user_uid_repository.dart';

class UserUIDFirebaseRepository implements UserUIDRepository {
  final FirebaseAuth _firebaseAuth;

  UserUIDFirebaseRepository(this._firebaseAuth);

  @override
  Stream<UserUID> read() {
    if (_firebaseAuth.currentUser == null) _login();
    return _firebaseAuth
        .authStateChanges()
        .map((event) => UserUID(event?.uid ?? ""));
  }

  @override
  Future<UserUID> readCurrent() async {
    if (_firebaseAuth.currentUser == null) await _login();
    var user = _firebaseAuth.currentUser;
    return UserUID(user?.uid ?? '');
  }

  Future<void> _login() {
    return _firebaseAuth.signInAnonymously();
  }
}