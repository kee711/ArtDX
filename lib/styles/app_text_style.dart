import 'package:flutter/material.dart';
import 'package:flutter_artdx/styles/palette.dart';

// This class is used to define all the text styles used in the app
class AppTextStyle {
  // static keyword : we can access this variable without creating an instance of this class

  // default fonts
  static final fontBlack = TextStyle(
    color: Palette.black,
    fontSize: 14,
  );

  static final artTitle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final artSubtitle = TextStyle(
    color: Colors.grey,
    fontSize: 17,
    fontWeight: FontWeight.normal,
  );

  static final cardTitle = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static final cardSubtext = TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );
}
