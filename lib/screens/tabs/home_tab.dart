import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

Widget createOutfits() {
  String date = DateFormat('MMMEd').format(DateTime.now());

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
                        date,
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
                  onPressed: () {},
                  icon: Icon(WeatherIcons.wiDaySunny),
                ),
                Text(
                  '',
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
                    'assets/ClothingAssets/zip-up_hoodie.png',
                    // height: 200.0,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/ClothingAssets/t-shirt_short_sleeves.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
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
                    'assets/ClothingAssets/jeans.png',
                    //height: 200.0,
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Image.asset(
                    'assets/ClothingAssets/generic_sneakers.png',
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
