import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  Future<AuthResult> login() {
    return FirebaseAuth.instance.signInAnonymously();
  }
}