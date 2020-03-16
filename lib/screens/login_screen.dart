import 'package:flutter/material.dart';
import 'package:drober_app/constants.dart';
import 'package:drober_app/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 50.0,
                  ),
                  Container(
                    height: 150.0,
                    child: Image.asset('assets/droberLogo.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 80.0,
                child: Text(
                  'Drober',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30.0,
                  ),
                ),
              ),
              TextField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RoundedButton(
                title: 'Login',
                colour: Colors.blue,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushReplacementNamed(
                          context, 'wardrobe_screen');
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
