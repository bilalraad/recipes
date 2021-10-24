import 'package:firebase_auth/firebase_auth.dart';

class AuthApi {
  final auth = FirebaseAuth.instance;
  Future<User> signUp(String email, String password) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user!;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> logIn(String email, String password) async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return (user.user!);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  bool isLogged() {
    return auth.currentUser != null;
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
