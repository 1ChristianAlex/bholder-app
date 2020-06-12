import 'package:firebase_auth/firebase_auth.dart';

class FBaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> singIn(String email, String pass) async {
    final AuthResult user =
        await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return user.user;
  }
}
