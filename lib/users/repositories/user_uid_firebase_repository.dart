import 'package:firebase_auth/firebase_auth.dart' as Auth;
import 'package:todaygoodwords/users/user_uid.dart';
import 'package:todaygoodwords/users/user_uid_repository.dart';

class UserUIDFirebaseRepository implements UserUIDRepository {
  @override
  Stream<UserUID> read() {
    Auth.FirebaseAuth.instance.signInAnonymously();
    return Auth.FirebaseAuth.instance.userChanges().map((event) => UserUID(event?.uid ?? ""));
  }

  @override
  Future<UserUID> readCurrent() async {
    await Auth.FirebaseAuth.instance.signInAnonymously();
    var user = Auth.FirebaseAuth.instance.currentUser;
    return UserUID(user?.uid ?? "");
  }
}