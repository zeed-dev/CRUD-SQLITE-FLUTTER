import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kRichWhite = Color(0xffffffff);
const Color kOxfordWhite = Color(0xFFF0F0F0);
const Color kPrussianBlue = Color(0xFF18B3AB);
const Color kMikadoBlue = Color(0xFF18B3AB);
const Color kDavysGrey = Color(0xFF344054);
const Color kBlackGrey = Color(0xFF020202);
const Color kGrey = Color(0xFF909090);
const Color kOrange = Color(0xFFFDF0E3);
const Color kOrangeSecondary = Color(0xFFFAE2C7);
const Color kOrangeDark = Color(0xFFAE5700);
const Color kYellow = Color(0xFFF79009);
const Color kSecondary = Color(0xFFFEEFC7);
const Color kBgColor = Color(0xffF5F8FF);
const Color kRedDark = Color(0xff970C0C);
const Color kRedSecondary = Color(0xffFAEAEA);
const Color KGreenSecondary = Color(0xffD1FADF);

const double defaultMargin = 16;

final TextStyle kHeading5 =
    GoogleFonts.openSans(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle kHeading6 = GoogleFonts.openSans(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: kDavysGrey);
final TextStyle kSubtitle = GoogleFonts.openSans(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: kDavysGrey);
final TextStyle kBodyText = GoogleFonts.openSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: kDavysGrey);
final TextStyle kBodyText2 = GoogleFonts.openSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: kDavysGrey);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);

const kColorScheme = ColorScheme(
  primary: kMikadoBlue,
  primaryVariant: kMikadoBlue,
  secondary: kPrussianBlue,
  secondaryVariant: kPrussianBlue,
  surface: kRichWhite,
  background: kRichWhite,
  error: Colors.red,
  onPrimary: kRichWhite,
  onSecondary: Colors.white,
  onSurface: Colors.black87,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.light,
);
