import 'package:farmersmarket/src/styles/buttons.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonsStyles.buttonHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        
      ),
    );
  }
}
