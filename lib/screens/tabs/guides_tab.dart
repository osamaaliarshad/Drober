import 'package:flutter/material.dart';
import 'dart:ui';

Widget createGuide() {
  return Scaffold(
    body: GridView.count(
      crossAxisCount: 1,
      children: <Widget>[
        createGuideCard('How should clothes fit', 'guide1.jpg'),
        createGuideCard('How to match with your skin tone', 'guide2.jpg'),
        createGuideCard('More Guides soon', ''),
      ],
    ),
  );
}

Card createGuideCard(String style, String image) {
  return Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: GestureDetector(
      onTap: () {
        if (style == 'Streetwear') {
          print('i pressed streetwear');
        } else {
          print('i pressed something else');
        }
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$image"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.5),
              child: Text(
                style,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
