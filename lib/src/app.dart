import 'package:farmersmarket/src/blocs/auth_bloc.dart';
import 'package:farmersmarket/src/routes.dart';
import 'package:farmersmarket/src/screens/landing.dart';
import 'package:farmersmarket/src/screens/login.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: PlatformApp(),
      providers: [
        Provider(
          create: (context) => authBloc,
        ),
        FutureProvider(
          create: (context) => authBloc.isLoggedIn(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  Widget build(BuildContext context) {
    var isLoggedIn = Provider.of<bool>(context);

    if (Platform.isIOS) {
      return CupertinoApp(
        home: (isLoggedIn == null) ? loadingScreen(true) : (isLoggedIn == true) ? Landing() : Login(),
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(
          primaryColor: AppColors.straw,
          scaffoldBackgroundColor: Colors.white,
          textTheme: CupertinoTextThemeData(
            tabLabelTextStyle: TextStyles.suggestion
          ),
        ),
      );
    } else {
      return MaterialApp(
        home: (isLoggedIn == null) ? loadingScreen(false) : (isLoggedIn == true) ? Landing() : Login(),
        onGenerateRoute: Routes.materialRoutes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      );
    }
  }

  Widget loadingScreen(bool isIOS) {
    return (isIOS)
        ? CupertinoPageScaffold(child: Center(child: CupertinoActivityIndicator(),),) : Scaffold(body: Center(child: CircularProgressIndicator(),),);
  }
}
