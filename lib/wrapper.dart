import 'authenticate.dart';
import 'home.dart';
import 'model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Wrapper class will decide where to navigate user

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    /// user variable will decide whether user should go to Home screen or Authenticate screen
    /// if user has some unique ID stored in the user variable already then it will navigate to home screen
    /// otherwise it will go to authenticate where user have to register themselves or sign-in.
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
