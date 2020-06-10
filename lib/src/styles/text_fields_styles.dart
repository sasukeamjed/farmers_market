import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/material.dart';

abstract class TextFieldsStyles{
  static double textBoxHorizontal (){
    return 25.0;
  }

  static double TextBoxVertical(){
    return 8.0;
  }

  static TextStyle text(){
    return TextStyles.body();
  }

  static TextStyle placeHolder(){
    return TextStyles.suggestion();
  }

  static Color cursorColor(){
    return AppColors.darkBlue();
  }

  static Widget iconPrefix(IconData icon){
    return Padding(
      padding: EdgeInsets.only(left: 8.0,),
      child: Icon(
        icon,
        size: 35.0,
        color: AppColors.lightBlue(),
      ),
    );
  }

  static TextAlign textAlign(){
    return TextAlign.center;
  }

  static BoxDecoration cupertinoDecoration(){
    return BoxDecoration(
        border: Border.all(color: AppColors.straw(), width: BaseStyles.borderWidth(),),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius())
    );
  }
}