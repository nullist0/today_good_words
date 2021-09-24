import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:todaygoodwords/model/data/users.dart';

abstract class UserRepository {
  Stream<User> read();
  Future<void> login();
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<void> login() {
    return Auth.FirebaseAuth.instance.signInAnonymously();
  }

  @override
  Stream<User> read() {
    return Auth.FirebaseAuth.instance.userChanges().map((event) => User(event?.uid ?? ""));
  }
}