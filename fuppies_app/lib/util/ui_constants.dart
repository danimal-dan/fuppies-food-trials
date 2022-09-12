import 'package:flutter/material.dart';

const SizedBox defaultVerticalSpacer = SizedBox(height: 24.0);

const int whiteValue = 0xFFECE9E9;
const Color white = Color(whiteValue);
const int lightBlueValue = 0xFFD3DCDE;
const Color lightBlue = Color(lightBlueValue);
const int greenValue = 0xFF28B67E;
const Color green = Color(greenValue);
const int darkGreenValue = 0xFF1D4C4F;
const Color darkGreen = Color(darkGreenValue);
const int darkBlueValue = 0xFF0D1321;
const Color darkBlue = Color(darkBlueValue);

const MaterialColor primarySwatch = MaterialColor(
  greenValue,
  <int, Color>{
    50: white,
    100: white,
    200: lightBlue,
    300: lightBlue,
    400: green,
    500: green,
    600: green,
    700: darkGreen,
    800: darkGreen,
    900: darkBlue,
  },
);
