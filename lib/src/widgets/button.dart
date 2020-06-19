import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/buttons.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final String buttonText;
  final ButtonType buttonType;

  const AppButton({Key key, @required this.buttonText, this.buttonType}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle fontStyle;
    Color buttonColor;


    switch(buttonType){
      case ButtonType.Straw:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.straw;
        break;
      case ButtonType.LightBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightBlue;
        break;
      case ButtonType.DarkBlue:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkBlue;
        break;
      case ButtonType.LightGrey:
        fontStyle = TextStyles.buttonTextDark;
        buttonColor = AppColors.lightGrey;
        break;
      case ButtonType.DarkGrey:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.darkGrey;
        break;
      default:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightBlue;
        break;
    }

    return Padding(
      padding: BaseStyles.listPadding,
      child: Container(
        height: ButtonsStyles.buttonHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          boxShadow: BaseStyles.boxShadow,
        ),
        child: Center(child: Text(buttonText, style: fontStyle,),),
      ),
    );
  }
}

enum ButtonType{
  LightBlue, Straw, LightGrey, DarkGrey, DarkBlue,
}
