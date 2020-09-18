import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_blog/core/constants/constants.dart';
import 'package:travel_blog/ui/auth/service/auth_service.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSafeAreaBody(context),
    );
  }

  SafeArea buildSafeAreaBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [const Color(0xff83a4d4), const Color(0xffffff)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  buildContainerLoginImg(),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            "Login",
                            style: AppConstants.appTextStyleTitle,
                          ),
                          buildTextFormFieldEmail(),
                          buildTextFormFieldPassword(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildContainerLogInButton(),
                            ],
                          ),
                          buildGestureDetectorSignUp(context),
                          SizedBox(height: 55),
                          buildRowLoginOptions()
                        ],
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
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
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
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
      decoration: InputDecoration(
        labelText: 'Email',
      ),
    );
  }

  GestureDetector buildGestureDetectorSignUp(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.toggleView();
      },
      child: buildRichTextSignUp(),
    );
  }

  Row buildRowLoginOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignInButton(
          Buttons.Facebook,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(
          Buttons.LinkedIn,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(
          Buttons.Twitter,
          mini: true,
          onPressed: () {},
        ),
        SignInButton(
          Buttons.Pinterest,
          mini: true,
          onPressed: () {},
        ),
      ],
    );
  }

  RichText buildRichTextSignUp() {
    return RichText(
        text: TextSpan(
            text: 'Don\'t you have an account?',
            style: TextStyle(
              fontSize: 15,
              color: Colors.blueGrey,
            ),
            children: <TextSpan>[
          TextSpan(
            text: '  Sign up',
            style: TextStyle(
              fontSize: 15,
              color: Colors.blueGrey,
            ),
          ),
        ]));
  }

  Container buildContainerLoginImg() {
    return Container(
        height: 150,
        width: 200,
        child: SvgPicture.asset("assets/images/loginn.svg"));
  }

  Container buildContainerLogInButton() {
    return Container(
      height: 70,
      width: 100,
      alignment: Alignment.centerRight,
      child: RaisedButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);

            if (result == null) {
              setState(() {
                error = 'Email or password is incorrect';
              });
            }
          }
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: Colors.indigo[200],
        child: Text("Log in"),
      ),
    );
  }
}
