import 'package:flutter/material.dart';

// final lightScheme = ColorScheme.fromSeed(seedColor: kPrimaryColor);
const lightScheme = ColorScheme(
  primary: kPrimaryColor,
  secondary: kAccentColor,
  surface: kCardBackground,
  background: Colors.red,
  error: Colors.amber,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Colors.black,
  onBackground: Colors.green,
  onError: Colors.blueGrey,
  brightness: Brightness.light,
);

final darkScheme = ColorScheme.fromSeed(seedColor: kPrimaryColor, brightness: Brightness.dark);

// const kPrimaryColor = MaterialColor(4285110003, {
//   50: Color(0xffe7eefd),
//   100: Color(0xffd0defb),
//   200: Color(0xffa1bdf7),
//   300: Color(0xff719cf4),
//   400: Color(0xff427bf0),
//   500: Color(0xff135aec),
//   600: Color(0xff0f48bd),
//   700: Color(0xff0b368e),
//   800: Color(0xff08245e),
//   900: Color(0xff04122f)
// });

const kPrimaryColor = Color(0xFFF17A1C);
const kAccentColor = Color(0xFFF17A1C);

const kPrimaryColorDark = Color(0xFF2E7D32);
const kPrimaryColorLight = Color(0xFF81C784);

const kTextColorBlack = Color.fromRGBO(48, 47, 48, 1.0);
const kTextColorGrey = Color.fromRGBO(141, 141, 141, 1.0);

const kPageBackground = Color(0xFFF5F5F5);
const kCardBackground = Color(0xFFFFFFFF);
const kGreyBackground = Color(0xFFFAFAFA);

const korange = Color(0xFFF2A22D);
const kRed = Color(0xFFB00020);
const kGreen = Color(0xFF10893E);
const kBlack = Color(0xFF000000);
const kGreyLight = Color(0xFFBDBDBD);
const kGreyDark = Color(0xFF757575);

const kIconColor = Color(0xff0b368e);
