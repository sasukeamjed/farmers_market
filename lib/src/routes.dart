import 'package:farmersmarket/src/screens/edit_product.dart';
import 'package:farmersmarket/src/screens/landing.dart';
import 'package:farmersmarket/src/screens/login.dart';
import 'package:farmersmarket/src/screens/signup.dart';
import 'package:farmersmarket/src/screens/vendor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return MaterialPageRoute(builder: (BuildContext context) => Landing());

      case "/signup":
        return MaterialPageRoute(builder: (BuildContext context) => SignUp());

      case "/login":
        return MaterialPageRoute(
          builder: (BuildContext context) => Login(),
        );

      case "/vendor":
        return MaterialPageRoute(
          builder: (BuildContext context) => Vendor(),
        );

      case "/editproduct":
        return MaterialPageRoute(
          builder: (BuildContext context) => EditProduct(),
        );

      default:
        return MaterialPageRoute(builder: (BuildContext context) => Login());
    }
  }

  static CupertinoPageRoute cupertinoRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/landing":
        return CupertinoPageRoute(builder: (BuildContext context) => Landing());

      case "/signup":
        return CupertinoPageRoute(builder: (BuildContext context) => SignUp());

      case "/login":
        return CupertinoPageRoute(builder: (BuildContext context) => Login());

      case "/vendor":
        return CupertinoPageRoute(builder: (BuildContext context) => Vendor());

      case "/editproduct":
        return CupertinoPageRoute(builder: (BuildContext context) => EditProduct());

      default:
        return CupertinoPageRoute(builder: (BuildContext context) => Login());
    }
  }
}
