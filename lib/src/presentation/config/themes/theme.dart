import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

const numberStyle = TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: 'NumberFont');
const linkStyle = TextStyle(fontSize: 15.0, color: Colors.blue, decoration: TextDecoration.lineThrough);

final darkTheme = ThemeData(
  colorScheme: darkScheme,
  // primarySwatch: Colors.grey,
  // primaryColor: Colors.black,
  // primaryColorLight: Colors.black87,
  // brightness: Brightness.dark,
  // // backgroundColor: const Color(0xFF212121),
  // dividerColor: Colors.black12,
  // textTheme: textThemeDefault,
);

final lightTheme = ThemeData(
  // primaryColor: kPrimaryColor,
  // colorSchemeSeed: Colors.blue,
  colorScheme: lightScheme,
  // colorScheme: const ColorScheme(
  //   primary: kPrimaryColor,
  //   primaryContainer: kPrimaryColor,
  //   secondary: kAccentColor,
  //   secondaryContainer: kAccentColor,
  //   surface: kCardBackground,
  //   background: Colors.red,
  //   error: Colors.amber,
  //   onPrimary: Colors.white,
  //   onSecondary: Colors.pink,
  //   onSurface: Colors.black,
  //   onBackground: Colors.green,
  //   onError: Colors.blueGrey,
  //   brightness: Brightness.light,
  // ),

  brightness: Brightness.light,
  backgroundColor: kGreyBackground,
  scaffoldBackgroundColor: kPageBackground,
  textTheme: GoogleFonts.tajawalTextTheme(), // same in appTheme.fontFamily

  ////////////////{ AppBar Theme } ////////////////
  appBarTheme: const AppBarTheme(
    elevation: 1,
  ),

  ////////////////{ Buttons Theme } ////////////////
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: kAccentColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: GoogleFonts.tajawal(fontWeight: FontWeight.bold, fontSize: 14),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(primary: kAccentColor)),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: kAccentColor)),

  ////////////////{ Card Theme } ////////////////
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    margin: const EdgeInsets.all(4),
    shadowColor: Colors.black38,
    elevation: 2,
    color: kCardBackground,
    clipBehavior: Clip.antiAlias,
  ),
);
////////////////{ Orginal } ////////////////
//  final lightTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.white,
//   brightness: Brightness.light,
//   backgroundColor: const Color(0xFFE5E5E5),
//   accentColor: Colors.black,
//   accentIconTheme: IconThemeData(color: Colors.white),
//   dividerColor: Colors.white54,
// );

const TextTheme textThemeDefault = TextTheme(
  headline1: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w500, fontSize: 26),
  headline2: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w500, fontSize: 22),
  headline3: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w500, fontSize: 20),
  headline4: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w500, fontSize: 16),
  headline5: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w700, fontSize: 14),
  headline6: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w700, fontSize: 12),
  bodyText1: TextStyle(color: kTextColorBlack, fontSize: 14, height: 1.5, fontWeight: FontWeight.normal),
  bodyText2: TextStyle(color: kTextColorBlack, fontSize: 12, height: 1.5),
  subtitle1: TextStyle(color: kTextColorBlack, fontSize: 13), // also textField textStyle
  subtitle2: TextStyle(color: kTextColorGrey, fontSize: 12, fontWeight: FontWeight.w400),
  button: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
);

const TextTheme textThemeSmall = TextTheme(
  headline1: TextStyle(fontSize: 18, color: kPrimaryColorDark, fontWeight: FontWeight.w900),
  headline2: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w700, fontSize: 20),
  headline3: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w700, fontSize: 18, height: 1.2),
  headline4: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w700, fontSize: 14),
  headline5: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w700, fontSize: 12),
  headline6: TextStyle(color: kTextColorBlack, fontWeight: FontWeight.w700, fontSize: 10),
  bodyText1: TextStyle(color: kTextColorBlack, fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
  bodyText2: TextStyle(color: kTextColorGrey, fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
  subtitle1: TextStyle(color: kTextColorBlack, fontSize: 10, fontWeight: FontWeight.w400), // also textField textStyle
  subtitle2: TextStyle(color: kTextColorGrey, fontSize: 10, fontWeight: FontWeight.w400),
  button: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
);
