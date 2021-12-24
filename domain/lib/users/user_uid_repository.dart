import 'package:domain/users/user_uid.dart';

abstract class UserUIDRepository {
  Stream<UserUID> read();
  Future<UserUID> readCurrent();
}