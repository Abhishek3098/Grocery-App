import 'package:f_groceries/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user object based on FirebaseUser

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebase(user));
        .map(_userFromFirebaseUser);
  }

//Sign in with email and password

//Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      //AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(user);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

//Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
