import 'dart:io';

import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text_fields_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(
        child: pageBody(context),
      );
    }else{
      return Scaffold(
        body: pageBody(context),
      );
    }
  }

  Widget pageBody(BuildContext context){
    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/top_bg.png',),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: TextFieldsStyles.textBoxHorizontal(), vertical: TextFieldsStyles.TextBoxVertical()),
          child: email(),
        ),
        password(),
      ],
    );
  }

  Widget email(){
    if(Platform.isIOS){
      return CupertinoTextField(
        padding: EdgeInsets.all(12.0),
        placeholder: 'Email',
        placeholderStyle: TextFieldsStyles.placeHolder(),
        style: TextFieldsStyles.text(),
        textAlign: TextFieldsStyles.textAlign(),
        cursorColor: TextFieldsStyles.cursorColor(),
        decoration: TextFieldsStyles.cupertinoDecoration(),
        prefix: TextFieldsStyles.iconPrefix(CupertinoIcons.mail_solid),
      );
    }else{
      return TextField();
    }

  }

  Widget password(){
    if(Platform.isIOS){
      return CupertinoTextField();
    }else{
      return TextField();
    }
  }
}
