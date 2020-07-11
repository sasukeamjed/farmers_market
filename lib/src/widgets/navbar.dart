import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppNavBar{
  static CupertinoSliverNavigationBar cupertinoSliverNavBar ({String title}){
    return CupertinoSliverNavigationBar(
      largeTitle: Text(title, style: TextStyles.navTitle,),
      backgroundColor: Colors.transparent,
      border: null,
    );
  }

  static SliverAppBar materialNavBar ({@required String title, TabBar tabBar}){
    return SliverAppBar(
      title: Text(title, style: TextStyles.navTitleMaterial,),
      backgroundColor: AppColors.darkBlue,
      bottom: tabBar,
      floating: true,
      pinned: true,
      snap: true,
    );
  }
}