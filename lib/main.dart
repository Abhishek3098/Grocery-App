import 'package:f_groceries/model/user.dart';
import 'package:f_groceries/services/auth.dart';
import 'package:f_groceries/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      /// Main page of the application
      /// This screen will be displayed on the user's phone when application runs
      value: AuthService().user,
      child: new MaterialApp(
        theme: new ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
            // counter didn't reset back to zero; the application is not restarted.

            primaryColor: Colors.white,
            primaryColorDark: Colors.white30,
            accentColor: Colors.blue),
        home: Wrapper(),
      ),
    );
  }
}
