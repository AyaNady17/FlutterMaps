import 'package:flutter/material.dart';

abstract class StylesManager {
//on boarding assets

  static const TextStyle textStyle32 = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: Colors.white,
  );

  static const TextStyle textStyle24 = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: Colors.white,
  );

  static const TextStyle textStyle16 = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Colors.white,
  );

  static const titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );
  static final titleMediumWithCustomColor = TextStyle(
    fontSize: 23,
    color: Colors.amber[200],
    fontWeight: FontWeight.w600,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.2,
  );

  static const textStyle26 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w900,
  );
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
}
