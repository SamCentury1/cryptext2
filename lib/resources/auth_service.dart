import 'package:cryptext2/resources/firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  String getUserEmail() => _firebaseAuth.currentUser?.email?? "User";

  Future<UserCredential?> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ]
      );

      final oAuthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      
      final UserCredential cred = await _firebaseAuth.signInWithCredential(oAuthCredential);

      FirestoreMethods().saveUserToDatabase(cred, "apple");

      return cred;

    } catch (e) {
      print("apple sign in error: $e");
      return null;
    }
  }


  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}