import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;

  User(this.uid);

  static User fromSnapshot(AuthResult result) {
    return User(result.user.uid);
  }

  User.empty(): uid = null;

  @override
  bool operator ==(other) {
    return uid == other.uid;
  }
}