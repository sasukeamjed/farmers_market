import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/buttons.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {

  final String buttonText;
  final ButtonType buttonType;
  final void Function() onPressed;

  const AppButton({Key key, @required this.buttonText, this.buttonType, this.onPressed}) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {

  bool pressed = false;

  @override
  Widget build(BuildContext context) {

    TextStyle fontStyle;
    Color buttonColor;


    switch(widget.buttonType){
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
      case ButtonType.Disabled:
        fontStyle = TextStyles.buttonTextLight;
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

    return AnimatedContainer(
      padding: EdgeInsets.only(
        top: (pressed) ? BaseStyles.ListFieldVertical + BaseStyles.animationOffset : BaseStyles.ListFieldVertical,
        bottom: (pressed) ? BaseStyles.ListFieldVertical - BaseStyles.animationOffset : BaseStyles.ListFieldVertical,
        left: BaseStyles.ListFieldHorizontal,
        right: BaseStyles.ListFieldHorizontal,
      ),
      child: GestureDetector(
        child: Container(
          height: ButtonsStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
            boxShadow: pressed ? BaseStyles.boxShadowPressed : BaseStyles.boxShadow,
          ),
          child: Center(child: Text(widget.buttonText, style: fontStyle,),),
        ),
        onTapDown: (details){
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTapUp: (details){
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTap: (){
          if (widget.buttonType != ButtonType.Disabled) {
            widget.onPressed();
          }
        },
      ),
      duration: Duration(milliseconds: 20),
    );
  }
}

enum ButtonType{
  LightBlue, Straw, Disabled, DarkGrey, DarkBlue,
}
