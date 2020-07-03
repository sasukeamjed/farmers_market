import 'package:farmersmarket/src/styles/tabbar.dart';
import 'package:farmersmarket/src/widgets/navbar.dart';
import 'package:farmersmarket/src/widgets/orders.dart';
import 'package:farmersmarket/src/widgets/products.dart';
import 'package:farmersmarket/src/widgets/profile.dart';
import 'package:farmersmarket/src/widgets/vendor_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Vendor extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoPageScaffold(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              AppNavBar.cupertinoSliverNavBar(title: 'Vendor Name', context: context)
            ];
          },
          body: VendorScaffold.cupertinoTabScaffold,
        ),
      );
    }else{
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
              return <Widget>[
                AppNavBar.materialNavBar(title: 'Vendor Name', tabBar: vendorTabBar)
              ];
            },
            body: TabBarView(
              children: <Widget>[
                Products(),
                Orders(),
                Profile(),
              ],
            ),
          ),
        ),
      );
    }
  }

  static TabBar get vendorTabBar{
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.list),
        ),
        Tab(
          icon: Icon(Icons.shopping_cart),
        ),
        Tab(
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}