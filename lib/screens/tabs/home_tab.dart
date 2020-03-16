import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget createOutfit() {
  String formatted = DateFormat('MMMEd').format(DateTime.now());

  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  formatted,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Baloo',
                  ),
                ),
                Text(
                  '60° F',
                  style: TextStyle(fontSize: 15.0, fontFamily: 'Baloo'),
                ),
              ],
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Image.asset(
                'assets/hoodie_black.png',
                height: 200.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Image.asset(
                'assets/t-shirt_black.png',
                height: 200.0,
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Image.asset(
                'assets/jeans_black.png',
                height: 200.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Image.asset(
                'assets/slip-onsneaker_black.png',
                width: 200.0,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
