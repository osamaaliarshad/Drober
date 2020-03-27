import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/services.dart';
import 'package:drober_app/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

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

  Widget _buildCreateAccAndForgotPasswordBtn() {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          child: FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'registration_screen');
            },
            padding: EdgeInsets.only(right: 0.0),
            child: Text(
              'Create Account',
              style: kLabelStyle,
            ),
          ),
        ),
        Spacer(),
        Container(
          alignment: Alignment.centerRight,
          child: FlatButton(
            onPressed: () => print('Forgot Password Button Pressed'),
            padding: EdgeInsets.only(right: 0.0),
            child: Text(
              'Forgot Password?',
              style: kLabelStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          setState(() {
            showSpinner = true;
          });
          try {
            final user = await _auth.signInWithEmailAndPassword(
                email: email, password: password);
            if (user != null) {
              Navigator.pushReplacementNamed(context, 'wardrobe_screen');
            }
            setState(() {
              showSpinner = false;
            });
          } catch (e) {
            print(e);
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.cyan,
        child: Text(
          'LOGIN',
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

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/google.png',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        systemNavigationBarColor: Color(0xFF73AEF5),
//        statusBarColor: Color(0xFF398AE5),
//        statusBarIconBrightness: Brightness.light));
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
                    _buildCreateAccAndForgotPasswordBtn(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildLoginBtn(),
                    _buildSocialBtnRow(),
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
