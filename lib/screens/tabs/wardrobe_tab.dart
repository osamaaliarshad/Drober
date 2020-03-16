import 'package:flutter/material.dart';

Widget myFabButton = Container(
  width: 70.0,
  height: 70.0,
  child: RawMaterialButton(
    fillColor: Color(0xff63ffda),
    shape: CircleBorder(),
    elevation: 6.0,
    child: Tab(
      icon: Image.asset(
        'assets/clothes.png',
        height: 50.0,
      ),
    ),
    onPressed: () {},
  ),
);

Widget createCloset() {
  return Scaffold(
    floatingActionButton: myFabButton,
  );
}
