import 'package:farmersmarket/src/styles/text_fields_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTextField extends StatelessWidget {
  final bool isIOS;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final TextInputType textInputType;
  final bool obscureText;

  const AppTextField({
    Key key,
    @required this.isIOS,
    @required this.hintText,
    @required this.cupertinoIcon,
    @required this.materialIcon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: TextFieldsStyles.textBoxHorizontal, vertical: TextFieldsStyles.TextBoxVertical),
        child: CupertinoTextField(
          keyboardType: textInputType,
          padding: EdgeInsets.all(12.0),
          placeholder: hintText,
          placeholderStyle: TextFieldsStyles.placeHolder,
          style: TextFieldsStyles.text,
          textAlign: TextFieldsStyles.textAlign,
          cursorColor: TextFieldsStyles.cursorColor,
          decoration: TextFieldsStyles.cupertinoDecoration,
          prefix: TextFieldsStyles.iconPrefix(cupertinoIcon),
          obscureText: obscureText,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: TextFieldsStyles.textBoxHorizontal, vertical: TextFieldsStyles.TextBoxVertical),
        child: TextField(
          keyboardType: textInputType,
          cursorColor: TextFieldsStyles.cursorColor,
          style: TextFieldsStyles.text,
          textAlign: TextFieldsStyles.textAlign,
          decoration: TextFieldsStyles.materialDecoration(
            hintText,
            materialIcon,
          ),
          obscureText: obscureText,
        ),
      );
    }
  }
}
