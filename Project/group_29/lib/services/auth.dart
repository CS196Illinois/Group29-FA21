import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //Sign Up Method
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Sign In With Email And Password
  Future signInEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Sign Out Method
  Future signOut() async {
    await _auth.signOut();

    print('Sign Out');
  }

  // Old Code Idk if this works
  //UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
  //User user = result.user!;
  //return user;
  // } catch (e) {
  // print(e.toString());
  //return null;
  //  }
  //}

}
