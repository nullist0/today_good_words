import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:todaygoodwords/users/user_uid.dart';

abstract class UserUIDRepository {
  Stream<UserUID> read();
  Future<UserUID> readCurrent();
}