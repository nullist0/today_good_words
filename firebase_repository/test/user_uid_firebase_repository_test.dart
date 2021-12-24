import 'package:domain/users/user_uid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_repository/user_uid_firebase_repository.dart';
import 'package:flutter_test/flutter_test.dart';

extension MockUserUIDFirebaseAuth on FirebaseAuth {
  static FirebaseAuth fromUserUID(UserUID userUID) {
    final MockUser mockUser = MockUser(isAnonymous: true, uid: userUID.uid);
    return MockFirebaseAuth(mockUser: mockUser);
  }
}

void main() {
  late UserUID userUID;
  late FirebaseAuth firebaseAuth;
  late UserUIDFirebaseRepository userUIDFirebaseRepository;

  setUp(() {
    userUID = UserUID('test-uid');
    firebaseAuth = MockUserUIDFirebaseAuth.fromUserUID(userUID);
    userUIDFirebaseRepository = UserUIDFirebaseRepository(firebaseAuth);
  });

  test('user uid firebase repository read stream emits user uid who currently logged in.', () {
    // given

    // when

    // then
    final currentUserUIDStream = userUIDFirebaseRepository.read();
    expectLater(currentUserUIDStream, emits(userUID));
  });

  test('user uid firebase repository reads user uid who currently logged in.', () async {
    // given

    // when

    // then
    final currentUserUID = await userUIDFirebaseRepository.readCurrent();
    expect(currentUserUID, userUID);
  });
}