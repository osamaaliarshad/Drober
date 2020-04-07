import 'dart:ui';
import 'package:flutter/material.dart';

Widget createStyles() {
  return Scaffold(
    body: GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        createStyleCard('Streetwear', 'streetwear.png'),
        createStyleCard('Formal', 'formal.png'),
        createStyleCard('Minimalism', 'minimalism.png'),
        createStyleCard('Palewave', 'palewave.png'),
        createStyleCard('Americana', 'americana.png'),
        createStyleCard('Saint Laurent-Paris', 'saintlaurent.png'),
        createStyleCard('Business Casual', 'businesscasual.png'),
        createStyleCard('More coming soon', 'more.png'),
      ],
    ),
  );
}

Card createStyleCard(String style, String image) {
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
            image: AssetImage("assets/StylePage/$image"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.3),
              child: Text(
                style,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
