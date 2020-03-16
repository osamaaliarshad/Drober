import 'package:drober_app/screens/tabs/stats_tab.dart';
import 'package:drober_app/screens/tabs/styles_tab.dart';
import 'package:drober_app/screens/tabs/wardrobe_tab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:drober_app/screens/tabs/home_tab.dart';

class WardrobeScreen extends StatefulWidget {
  static const String id = 'wardrobe_screen';
  @override
  _WardrobeScreenState createState() => _WardrobeScreenState();
}

class _WardrobeScreenState extends State<WardrobeScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  int _currentIndex = 0;

  final tabs = [
    createOutfit(),
    createCloset(),
    createStyles(),
    createStats(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, 'settings_screen');
            },
          )
        ],
        title: Text(
          'Drober',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Wardrobe'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library),
              title: Text('Styles'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Stats'),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
