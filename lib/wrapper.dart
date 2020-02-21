import 'package:f_groceries/authenticate.dart';
import 'package:f_groceries/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either Home and or Authenticate widget
    return Authenticate();
  }
}
