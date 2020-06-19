import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class TextFieldsStyles{
  static double get textBoxHorizontal => BaseStyles.ListFieldHorizontal;

  static double get TextBoxVertical=> BaseStyles.ListFieldVertical;

  static TextStyle get text=> TextStyles.body;

  static TextStyle get placeHolder=> TextStyles.suggestion;

  static Color get cursorColor=> AppColors.darkBlue;

  static Widget iconPrefix(IconData icon){
    return Padding(
      padding: EdgeInsets.only(left: 8.0,),
      child: Icon(
        icon,
        size: 35.0,
        color: AppColors.lightBlue,
      ),
    );
  }

  static TextAlign get textAlign=> TextAlign.center;

  static BoxDecoration get cupertinoDecoration{
    return BoxDecoration(
        border: Border.all(color: AppColors.straw, width: BaseStyles.borderWidth,),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius)
    );
  }

  static InputDecoration materialDecoration(String hintText, IconData icon){
    return InputDecoration(
      contentPadding: EdgeInsets.all(8.0),
      hintText: hintText,
      hintStyle: TextFieldsStyles.placeHolder,
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.straw, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.straw, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      prefixIcon: iconPrefix(icon),
    );
  }
}