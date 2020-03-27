import 'package:flutter/material.dart';
import 'package:drober_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String password2;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your email',
                hintStyle: kHintTextStyle),
            onChanged: (value) {
              email = value;
            },
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle.copyWith(
            color: Colors.indigo,
          ),
          height: 60.0,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your password',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value) {
              password = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle.copyWith(
            color: Colors.indigo,
          ),
          height: 60.0,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Verify password',
              hintStyle: kHintTextStyle,
            ),
            onChanged: (value) {
              password2 = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerLeft,
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login_screen');
        },
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Already have an account?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          setState(() {
            showSpinner = true;
          });
          if ((password == password2) && (password != null)) {
            try {
              final newUser = await _auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              if (newUser != null) {
                Navigator.pushReplacementNamed(context, 'wardrobe_screen');
              }
              setState(() {
                showSpinner = false;
              });
            } catch (e) {
              print(e);
            }
          } else if (password == null) {}
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.cyan,
        child: Text(
          'REGISTER',
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: 150,
                      child: Image.asset('assets/droberLogo17.png'),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: 50.0,
                      child: Text(
                        'Drober',
                        style:
                            TextStyle(fontFamily: 'Pacifico', fontSize: 25.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildEmailTF(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTF(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTF2(),
                    _buildForgotPasswordBtn(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildRegisterBtn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
