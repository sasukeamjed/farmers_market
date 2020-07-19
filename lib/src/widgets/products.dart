import 'package:cupertino_toolbar/cupertino_toolbar.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: CupertinoToolbar(
          body: pageBody(),
          items: <CupertinoToolbarItem>[
            CupertinoToolbarItem(
              icon: CupertinoIcons.add,
              onPressed: () => Navigator.of(context).pushNamed('/editproduct'),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: pageBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.straw,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/editproduct'),
        ),
      );
    }
  }

  Widget pageBody() {
    return Center(
      child: Text('Products'),
    );
  }
}
