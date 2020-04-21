import 'package:f_groceries/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  /// firebase auth object which is an instance of that FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Create user object based on FirebaseUser
  /// if user is not equal to null then user has uid otherwise it will be always null
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  /// auth change user stream
  /// check the status of user (signed in or not)
  /// if signed in show the home page otherwise show Login Screen
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }

  /// Method that user can sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {

    assert(email != null);
    assert(password != null && password.length >= 6);

    try {
      FirebaseUser user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(user);

      assert(user != null);

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  /// Method that register user with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    assert(email != null);
    assert(password != null && password.length >= 6);

    try {
      //AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(user);
      assert(user != null);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  /// Method from where user can sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
