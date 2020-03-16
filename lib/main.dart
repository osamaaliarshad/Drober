import 'package:drober_app/screens/login_screen.dart';
import 'package:drober_app/screens/registration_screen.dart';
import 'package:drober_app/screens/settings_screen.dart';
import 'package:drober_app/screens/wardrobe_home_screen.dart';
import 'package:drober_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xff2e2e2e),
      statusBarColor: Color(0xff222222),
      statusBarIconBrightness: Brightness.light));
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: WardrobeScreen.id,
      routes: {
        WardrobeScreen.id: (context) => WardrobeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
      },
    );
  }
}
