import 'logind_signup.dart';
import 'services/auth.dart';
import 'package:flutter/material.dart';
import 'loading.dart';

class Signup_Screen extends StatefulWidget {
  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  const Signup_Screen(
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
  State<StatefulWidget> createState() => signup();
}

class signup extends State<Signup_Screen> {
  /// get current user information
  final AuthService _auth = AuthService();

  ///holds first name of user
  String firstName = '';

  ///holds last name of user
  String lastName = '';

  ///holds phone number of user
  String phone = '';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool _obscureText = true;
    return loading
        ? Loading()
        : Scaffold(
            key: scaffoldKey,
            appBar: new AppBar(
              title: Text('Signup'),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login_Screen()));
                          },
                          child: new Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        _verticalD(),
                        new GestureDetector(
                          onTap: () {
                            /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signup_screen()));*/
                          },
                          child: new Text(
                            'Signup',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black87,
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
                                              Icons.person,
                                              color: Colors.black38,
                                            ),
                                            hintText: 'Enter first name',
                                            labelText: 'First Name',
                                            labelStyle: TextStyle(
                                                color: Colors.black54)),
                                        keyboardType: TextInputType.text,
                                        validator: (val) => val.length < 1
                                            ? 'Enter first name'
                                            : null,
                                        //onSaved: (val) => _firstname = val,
                                        onChanged: (val) => firstName = val,
                                      ),
                                      const SizedBox(height: 24.0),
                                      TextFormField(
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
                                              Icons.perm_identity,
                                              color: Colors.black38,
                                            ),
                                            hintText: 'Enter last name',
                                            labelText: 'Last Name',
                                            labelStyle: TextStyle(
                                                color: Colors.black54)),
                                        keyboardType: TextInputType.text,
                                        validator: (val) => val.length < 1
                                            ? 'Enter last name'
                                            : null,
                                        //onSaved: (val) => _lastname = val,
                                        onChanged: (val) => lastName = val,
                                      ),
                                      const SizedBox(height: 24.0),
                                      TextFormField(
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
                                        validator: validateEmail,
                                        /*onSaved: (String val) {
                                          _email = val;
                                        },*/
                                        onChanged: (val) => email = val,
                                      ),
                                      const SizedBox(height: 24.0),
                                      TextFormField(
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
                                              Icons.phone_android,
                                              color: Colors.black38,
                                            ),
                                            hintText: 'Your phone number',
                                            labelText: 'Phone',
                                            labelStyle: TextStyle(
                                                color: Colors.black54)),
                                        keyboardType: TextInputType.phone,
                                        validator: validateMobile,
                                        /*onSaved: (String val) {
                                          _phone = val;
                                        },*/
                                        onChanged: (val) => phone = val,
                                      ),
                                      const SizedBox(height: 24.0),
                                      TextFormField(
                                        obscureText: true,
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
                                            ? 'Password too short. (must be 6 char long)'
                                            : null,
                                        //onSaved: (val) => _password = val,
                                        onChanged: (val) => password = val,
                                      ),
                                      SizedBox(
                                        height: 35.0,
                                      ),
                                      new Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            new Container(
                                              alignment: Alignment.bottomRight,
                                              child: new GestureDetector(
                                                onTap: () async {
                                                  //_submit();
                                                  /*print (firstName);
                                                  print(lastName);
                                                  print(email);
                                                  print(phone);
                                                  print(password);*/
                                                  setState(
                                                      () => loading = true);
                                                  if (formKey.currentState
                                                      .validate()) {
                                                    dynamic result = await _auth
                                                        .registerWithEmailAndPassword(
                                                            email, password);
                                                    //print(email);
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
                                                  'SIGNUP',
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

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
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
    /* final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);*/
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Login_Screen()));
  }

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 10.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
