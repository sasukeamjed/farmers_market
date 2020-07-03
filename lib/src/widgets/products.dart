import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(
        child: pageBody(),
      );
    }else{
      return Scaffold(
        body: pageBody(),
      );
    }
  }

  Widget pageBody(){
    return Center(
      child: Text('Products'),
    );
  }
}
