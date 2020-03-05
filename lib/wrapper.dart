import 'package:f_groceries/authenticate.dart';
import 'package:f_groceries/home.dart';
import 'package:f_groceries/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either Home and or Authenticate widget
    if(user == null){
      return Authenticate();
    } else{
      return Home();
    }
  }
}
