import 'package:flutter/material.dart';
import 'package:drober_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
            RoundedButton(
              title: 'Register',
              colour: Colors.cyan,
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'registration_screen');
              },
            ),
            RoundedButton(
              title: 'Login',
              colour: Colors.blue,
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
