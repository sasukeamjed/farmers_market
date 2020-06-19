import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/buttons.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppSocialButton extends StatelessWidget {

  final SocialType socialType;

  const AppSocialButton({Key key, @required this.socialType}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    Color buttonColor;
    Color iconColor;
    IconData icon;

    switch(socialType){
      case SocialType.Facebook:
        iconColor = Colors.white;
        buttonColor = AppColors.facebook;
        icon = FontAwesomeIcons.facebookF;
        break;
      case SocialType.Google:
        iconColor = Colors.white;
        buttonColor = AppColors.google;
        icon = FontAwesomeIcons.google;
        break;
      default:
        iconColor = Colors.white;
        buttonColor = AppColors.facebook;
        icon = FontAwesomeIcons.facebookF;
        break;
    }

    return Container(
      height: ButtonsStyles.buttonHeight,
      width: ButtonsStyles.buttonHeight,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
        boxShadow: BaseStyles.boxShadow,
      ),
      child: Icon(icon, color: iconColor,),
    );
  }
}

enum SocialType{
  Facebook, Google
}
