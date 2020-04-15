import 'HomeScreen.dart';
import 'services/auth.dart';
import 'signup_screen.dart';
import 'package:flutter/material.dart';
import 'loading.dart';

class Login_Screen extends StatefulWidget {
  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  const Login_Screen(
      {Key key,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted})
      : super(key: key);

  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      hintColor: Colors.red,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => login();
}

class login extends State<Login_Screen> {
  final AuthService _auth = AuthService();

  ///holds email address of user
  String email = '';

  ///holds password of user
  String password = '';

  ///handles error message
  String error = '';

  ShapeBorder shape;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ///holds all variable values
  final formKey = GlobalKey<FormState>();

  /// holds the state of the loading widget
  bool loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autovalidate = false;
  bool _formWasEdited = false;

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool _obscureText = true;
    return loading
        ? Loading()
        : Scaffold(
            key: scaffoldKey,
            appBar: new AppBar(
              title: Text('Login'),
              backgroundColor: Colors.white,
            ),
            body: SafeArea(
                child: new SingleChildScrollView(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    height: 50.0,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 7.0),
                    child: new Row(
                      children: <Widget>[
                        _verticalD(),
                        new GestureDetector(
                          onTap: () {
                            /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login_screen()));*/
                          },
                          child: new Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        _verticalD(),
                        new GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup_Screen()));
                          },
                          child: new Text(
                            'Signup',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new SafeArea(
                      top: false,
                      bottom: false,
                      child: Card(
                          elevation: 5.0,
                          child: Form(
                              key: formKey,
                              autovalidate: _autovalidate,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      const SizedBox(height: 24.0),
                                      TextFormField(
                                        onChanged: (val) {
                                          setState(() => email = val);
                                        },
                                        decoration: const InputDecoration(
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black87,
                                                  style: BorderStyle.solid),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black87,
                                                  style: BorderStyle.solid),
                                            ),
                                            icon: Icon(
                                              Icons.email,
                                              color: Colors.black38,
                                            ),
                                            hintText: 'Your email address',
                                            labelText: 'E-mail',
                                            labelStyle: TextStyle(
                                                color: Colors.black54)),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (val) => !val.contains('@')
                                            ? 'Not a valid email.'
                                            : null,
                                        //onSaved: (val) => _email = val,
                                      ),
                                      const SizedBox(height: 24.0),
                                      TextFormField(
                                        obscureText: true,
                                        onChanged: (val) {
                                          setState(() => password = val);
                                        },
                                        decoration: const InputDecoration(
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black87,
                                                  style: BorderStyle.solid),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black87,
                                                  style: BorderStyle.solid),
                                            ),
                                            icon: Icon(
                                              Icons.lock,
                                              color: Colors.black38,
                                            ),
                                            hintText: 'Your password',
                                            labelText: 'Password',
                                            labelStyle: TextStyle(
                                                color: Colors.black54)),

                                        validator: (val) => val.length < 6
                                            ? 'Password too short.'
                                            : null,
                                        //onSaved: (val) => _password = val,
                                      ),
                                      SizedBox(
                                        height: 35.0,
                                      ),
                                      new Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            new Container(
                                              alignment: Alignment.bottomLeft,
                                              margin:
                                                  EdgeInsets.only(left: 10.0),
                                              child: new GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  'FORGOT PASSWORD?',
                                                  style: TextStyle(
                                                      color: Colors.blueAccent,
                                                      fontSize: 13.0),
                                                ),
                                              ),
                                            ),
                                            new Container(
                                              alignment: Alignment.bottomRight,
                                              child: new GestureDetector(
                                                onTap: () async {
                                                  //_submit();
                                                  //print(email);
                                                  //print(password);
                                                  if (formKey.currentState
                                                      .validate()) {
                                                    setState(
                                                        () => loading = true);

                                                    /// Method for signing in the user with firebase database
                                                    dynamic result = await _auth
                                                        .signInWithEmailAndPassword(
                                                            email, password);
                                                    if (result == null) {
                                                      setState(() {
                                                        loading = false;
                                                        error =
                                                            'Could not sign in with those credentials';
                                                      });
                                                    }
                                                  }
                                                },
                                                child: Text(
                                                  'LOGIN',
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12.0),
                                            Text(
                                              error,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 14.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                              )) //login,
                          ))
                ],
              ),
            )));
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    } else {
      showInSnackBar('Please fix the errors in red before submitting.');
    }
  }

  void showInSnackBar(String value) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home_screen()));
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
