import 'package:flutter/material.dart';
import 'package:travel_blog/ui/auth/service/auth_service.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarRegister(),
      body: buildContainerRegisterForm(),
    );
  }

  AppBar buildAppBarRegister() {
    return AppBar(
      actions: [
        FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign in'))
      ],
    );
  }

  Container buildContainerRegisterForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return 'Enter an email';
                } else {
                  return null;
                }
              },
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (val) {
                if (val.length < 6) {
                  return 'Enter a password with min 6 chars';
                } else {
                  return null;
                }
              },
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(height: 20),
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  dynamic result =
                      await _auth.registerWithEmailAndPassword(email, password);
                  if (result == null) {
                    setState(() {
                      error = 'Please enter a valid email';
                    });
                  }
                }
              },
            ),
            SizedBox(height: 12.0),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
