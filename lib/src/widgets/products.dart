import 'package:cupertino_toolbar/cupertino_toolbar.dart';
import 'package:farmersmarket/src/blocs/auth_bloc.dart';
import 'package:farmersmarket/src/blocs/product_bloc.dart';
import 'package:farmersmarket/src/models/product.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);
    var authBloc = Provider.of<AuthBloc>(context);

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: CupertinoToolbar(
          body: pageBody(productBloc, authBloc.userId),
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
        body: pageBody(productBloc, authBloc.userId),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.straw,
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/editproduct'),
        ),
      );
    }
  }

  Widget pageBody(ProductBloc productBloc, String vendorId) {
    return StreamBuilder<List<Product>>(
      stream: productBloc.productByVendorId(vendorId),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          if(Platform.isIOS){
            return CupertinoActivityIndicator();
          }
          return CircularProgressIndicator();
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index){
            var product = snapshot.data[index];
            return Text(product.productName);
          },
        );
      }
    );
  }
}
