import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_blog/ui/register_page/register_page.dart';

class LoginPage extends StatelessWidget {
  Widget _textFormField(String labelText) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 60),
                  Container(
                      height: 150,
                      width: 200,
                      child: SvgPicture.asset("assets/images/loginn.svg")),
                  Container(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 40),
                      child: Column(
                        children: <Widget>[
                          Text("Login"),
                          _textFormField(
                            'Email',
                          ),
                          _textFormField(
                            'Password',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 100,
                                alignment: Alignment.centerRight,
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  color: Colors.indigo[200],
                                  child: Text("Log in"),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterPage())); //gitmek istediğin sayfa
                            },
                            child: RichText(
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
                                ])),
                          ),
                          SizedBox(height: 55),
                          Row(
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
                          )
                        ],
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 600,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
