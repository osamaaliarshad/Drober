import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

Widget createOutfit() {
  String formatted = DateFormat('MMMEd').format(DateTime.now());

  return Scrollbar(
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        formatted,
                        style: TextStyle(
                          fontSize: 18.0,
                          //fontFamily: 'Baloo',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    print('weather button pressed');
                  },
                  icon: Icon(WeatherIcons.wiDaySunny),
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
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Card(
                  child: Image.asset(
                    'assets/zip-up_hoodie.png',
                    // height: 200.0,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Image.asset(
                    'assets/t-shirt_short_sleeves.png',
                    //height: 200.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Card(
                  child: Image.asset(
                    'assets/jeans.png',
                    //height: 200.0,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Image.asset(
                    'assets/generic_sneakers.png',
                    //width: 200.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
