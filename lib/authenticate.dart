import 'logind_signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    /// User will go to login screen after authentication after login
    return Container(
      child: Login_Screen(),
    );
  }
}
