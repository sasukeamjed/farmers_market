import 'package:farmersmarket/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles{

  static TextStyle get body{
    return GoogleFonts.roboto(textStyle: TextStyle(color: AppColors.darkGrey, fontSize: 16.0));
  }

  static TextStyle get suggestion{
    return GoogleFonts.roboto(textStyle: TextStyle(color: AppColors.lightGrey, fontSize: 14.0));
  }

  static TextStyle get buttonTextLight{
    return GoogleFonts.roboto(textStyle: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold));
  }

  static TextStyle get buttonTextDark{
    return GoogleFonts.roboto(textStyle: TextStyle(color: AppColors.darkGrey, fontSize: 17.0, fontWeight: FontWeight.bold));
  }

  static TextStyle get link{
    return GoogleFonts.roboto(textStyle: TextStyle(color: AppColors.straw, fontSize: 16.0, fontWeight: FontWeight.bold));
  }

  static TextStyle get error{
    return GoogleFonts.roboto(textStyle: TextStyle(color: AppColors.red, fontSize: 12.0));
  }

}