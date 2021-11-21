import 'package:todaygoodwords/users/user_uid.dart';

abstract class UserUIDRepository {
  Future<void> login();
  Stream<UserUID> read();
  Future<UserUID> readCurrent();
}