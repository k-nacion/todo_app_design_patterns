import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFFf4f7f9);
const onPrimarColor = Color(0xFF252726);

const secondaryColor = Color(0xFFaa4f66);

const primaryDarkColor = Color(0xFF19242e);
const onPrimaryDarkColor = Color(0xFFd8d4d0);

ThemeData darkTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: secondaryColor,
    // background: primaryDarkColor,
    // onBackground: onPrimaryDarkColor,
    // primary: primaryDarkColor,
    // onPrimary: onPrimaryDarkColor,
    // secondary: secondaryColor,
    // primaryContainer: secondaryColor,
    // surface: Colors.transparent,
  ),
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(),
).copyWith();
