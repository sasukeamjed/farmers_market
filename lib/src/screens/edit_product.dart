import 'package:farmersmarket/src/blocs/product_bloc.dart';
import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:farmersmarket/src/widgets/button.dart';
import 'package:farmersmarket/src/widgets/dropdown_button.dart';
import 'package:farmersmarket/src/widgets/sliver_scaffold.dart';
import 'package:farmersmarket/src/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    var productBloc = Provider.of<ProductBloc>(context);

    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: '',
          pageBody: pageBody(true, productBloc, context),
          context: context);
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: '',
          pageBody: pageBody(false, productBloc, context),
          context: context);
    }
  }

  Widget pageBody(bool isIOS, ProductBloc productBloc, BuildContext context) {
    var items = Provider.of<List<String>>(context);
    return ListView(
      children: <Widget>[
        Text(
          'Add Product',
          style: TextStyles.subTitle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: BaseStyles.listPadding,
          child: Divider(
            color: AppColors.darkBlue,
          ),
        ),
        StreamBuilder<String>(
            stream: productBloc.productName,
            builder: (context, snapshot) {
              return AppTextField(
                cupertinoIcon: FontAwesomeIcons.shoppingBasket,
                materialIcon: FontAwesomeIcons.shoppingBasket,
                hintText: 'Product Name',
                isIOS: isIOS,
                errorText: snapshot.error,
                onChanged: productBloc.changeProductName,
              );
            }),
        StreamBuilder<String>(
          stream: productBloc.unitType,
          builder: (context, snapshot) {
            return AppDropDownButton(
              hintText: 'Unit Type',
              items: items,
              value: snapshot.data,
              materialIcon: FontAwesomeIcons.balanceScale,
              cupertinoIcon: FontAwesomeIcons.balanceScale,
              onChanged: productBloc.changeUnitType,
            );
          }
        ),
        StreamBuilder<double>(
            stream: productBloc.unitPrice,
            builder: (context, snapshot) {
              return AppTextField(
                cupertinoIcon: FontAwesomeIcons.tag,
                materialIcon: FontAwesomeIcons.tag,
                hintText: 'Unit Price',
                isIOS: isIOS,
                textInputType: TextInputType.number,
                errorText: snapshot.error,
                onChanged: productBloc.changeUnitPrice,
              );
            }),
        StreamBuilder<int>(
            stream: productBloc.availableUnits,
            builder: (context, snapshot) {
              return AppTextField(
                cupertinoIcon: FontAwesomeIcons.cubes,
                materialIcon: FontAwesomeIcons.cubes,
                hintText: 'Available Units',
                isIOS: isIOS,
                textInputType: TextInputType.number,
                errorText: snapshot.error,
                onChanged: productBloc.changeAvailableUnits,
              );
            }),
        AppButton(
          buttonType: ButtonType.Straw,
          buttonText: 'Add Image',
        ),
        StreamBuilder<bool>(
          stream: productBloc.isValid,
          builder: (context, snapshot) {
            return AppButton(
              buttonType: (snapshot.data == true) ? ButtonType.DarkBlue : ButtonType.Disabled,
              buttonText: 'Save Product',
            );
          }
        ),
      ],
    );
  }
}
