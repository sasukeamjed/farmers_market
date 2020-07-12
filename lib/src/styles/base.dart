import 'package:farmersmarket/src/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class BaseStyles{


  static double get borderRadius => 25.0;

  static double get borderWidth => 2.0;

  static double get ListFieldHorizontal => 25.0;

  static double get ListFieldVertical=> 8.0;

  static EdgeInsets get listPadding{
    return EdgeInsets.symmetric(horizontal: ListFieldHorizontal, vertical: ListFieldVertical);
  }

  static double get animationOffset => 2.0;

  static List<BoxShadow> get boxShadow{
    return [
      BoxShadow(
        color: AppColors.darkGrey.withOpacity(.5),
        offset: Offset(1.0, 2.0),
        blurRadius: 2.0,
      ),
    ];
  }

  static List<BoxShadow> get boxShadowPressed{
    return [
      BoxShadow(
        color: AppColors.darkGrey.withOpacity(.5),
        offset: Offset(1.0, 1.0),
        blurRadius: 1.0,
      ),
    ];
  }

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
}