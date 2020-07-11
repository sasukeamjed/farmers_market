import 'package:flutter/material.dart';
import 'dart:io';

class AppDropDownButton extends StatelessWidget {
  final List<String> items;

  const AppDropDownButton({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return Container();
    }else{
      return DropdownButton<String>(
        items: ,
      );
    }
  }

  List<DropdownMenuItem<String>> buildMaterialItems(List<String> items){
    return items.map((item)=> DropDownMenuItem<String>(
      child:Text(item, textAlign: TextAlign.center),
    ));
  }
}
