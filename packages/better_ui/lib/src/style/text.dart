import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin TextStyleMixin {
  final head = GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 38,
      fontWeight: FontWeight.w700,
      height: 1.2,
    ),
  );

  final subHead = GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );

  final sub2Head = GoogleFonts.sourceSansPro(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );

  final menu = GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 18,
      height: 1.1,
    ),
  );

  final defaultShadow = BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 20,
    color: Colors.black26,
  );

  final lightShadow = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 27,
    color: Colors.black12,
  );
}
