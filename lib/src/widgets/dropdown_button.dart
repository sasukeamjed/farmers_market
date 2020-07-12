import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/buttons.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AppDropDownButton extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;

  const AppDropDownButton({Key key, @required this.items, @required this.hintText, this.materialIcon, this.cupertinoIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return Container();
    }else{
      return Padding(
        padding: BaseStyles.listPadding,
        child: Container(
          height: ButtonsStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.straw, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 35.0,
                child: BaseStyles.iconPrefix(materialIcon),
              ),
              Expanded(
                child: Center(
                  child: DropdownButton<String>(
                    items: buildMaterialItems(items),
                    value: null,
                    hint: Text(hintText, style: TextStyles.suggestion,),
                    style: TextStyles.body,
                    underline: Container(),
                    iconEnabledColor: AppColors.straw,
                    onChanged: (value){

                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  List<DropdownMenuItem<String>> buildMaterialItems(List<String> items){
    return items.map((item)=> DropdownMenuItem<String>(
      value: item,
      child:Text(item, textAlign: TextAlign.center),
    )).toList();
  }
}
