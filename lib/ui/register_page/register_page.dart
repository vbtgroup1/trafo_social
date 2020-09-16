import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_blog/ui/login_page/logip_page.dart';

class RegisterPage extends StatelessWidget {
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.keyboard_arrow_left,
                    color: Colors.blueGrey),
                onPressed: () => Navigator.of(context).pop(null),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
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
                      Container(
                          height: 150,
                          width: 200,
                          child: SvgPicture.asset("assets/images/loginn.svg")),
                      Container(
                          padding:
                              EdgeInsets.only(left: 30, right: 30, top: 40),
                          child: Column(
                            children: <Widget>[
                              Text("Register"),
                              _textFormField(
                                'Email',
                              ),
                              _textFormField(
                                'Password',
                              ),
                              _textFormField(
                                'Confirm Password',
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
                                      child: Text("Sign Up"),
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
                                              LoginPage())); //gitmek istediğin sayfa
                                },
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Do you have an account?',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueGrey,
                                        ),
                                        children: <TextSpan>[
                                      TextSpan(
                                        text: '  Login',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueGrey,
                                        ),
                                      )
                                    ])),
                              ),
                              SizedBox(height: 20),
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
