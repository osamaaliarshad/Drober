import 'package:drober_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SettingsList(
          sections: [
            SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(
                  title: 'Sign Out',
                  leading: Icon(Icons.exit_to_app),
                  onTap: () async {
                    await _auth.signOut();
                    //FIX LOGOUT
                    Navigator.pushReplacementNamed(context, LoginScreen.id);
//                    Navigator.popUntil(
//                      context,
//                      ModalRoute.withName(LoginScreen.id),
//                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
