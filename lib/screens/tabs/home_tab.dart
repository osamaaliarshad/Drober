import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget createOutfit() {
  String formatted = DateFormat('MMMEd').format(DateTime.now());

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    fontSize: 18.0,
                    //fontFamily: 'Baloo',
                  ),
                ),
                Text(
                  '60° F',
                  style: TextStyle(
                    fontSize: 13.0,
                    //fontFamily: 'Baloo'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Card(
              child: Image.asset(
                'assets/hoodie_black.png',
                // height: 200.0,
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: Image.asset(
                'assets/t-shirt_black.png',
                //height: 200.0,
              ),
            ),
          ),
        ],
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Card(
                child: Image.asset(
                  'assets/jeans_black.png',
                  //height: 200.0,
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Image.asset(
                  'assets/slip-onsneaker_black.png',
                  //width: 200.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
