import 'package:farmersmarket/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles{

  static TextStyle body(){
    return GoogleFonts.roboto(textStyle: TextStyle(color: AppColors.darkGrey(), fontSize: 16.0));
  }

  static TextStyle suggestion(){
    return GoogleFonts.roboto(textStyle: TextStyle(color: AppColors.lightGrey(), fontSize: 14.0));
  }

}