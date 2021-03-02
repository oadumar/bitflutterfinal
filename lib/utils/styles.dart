import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//  Se invocó pero no funcionó en la clase del 28ENE2021
Color azes = Color(0x91B4FB);
Color azes2 = HexColor("#344E56");

class EstTex {
  static const estTex = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.blueAccent,
  );

  static const draOptG = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black38,
  );

  static const draOptGN = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const draOptM = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black38,
  );

  static const draOptP = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black38,
  );

  static const estBotG = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.purple,
  );

  static const estBotM = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.purple,
  );

  static const estBotP = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.purple,
  );
}
