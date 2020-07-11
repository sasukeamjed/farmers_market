import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:farmersmarket/src/widgets/button.dart';
import 'package:farmersmarket/src/widgets/sliver_scaffold.dart';
import 'package:farmersmarket/src/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return AppSliverScaffold.cupertinoSliverScaffold(
          navTitle: '', pageBody: pageBody(true), context: context);
    } else {
      return AppSliverScaffold.materialSliverScaffold(
          navTitle: '', pageBody: pageBody(false), context: context);
    }
  }

  Widget pageBody(bool isIOS) {
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
        AppTextField(
          cupertinoIcon: FontAwesomeIcons.shoppingBasket,
          materialIcon: FontAwesomeIcons.shoppingBasket,
          hintText: 'Product Name',
          isIOS: isIOS,
        ),
        AppTextField(
          cupertinoIcon: FontAwesomeIcons.balanceScale,
          materialIcon: FontAwesomeIcons.balanceScale,
          hintText: 'Unit Type',
          isIOS: isIOS,
        ),
        AppTextField(
          cupertinoIcon: FontAwesomeIcons.tag,
          materialIcon: FontAwesomeIcons.tag,
          hintText: 'Unit Price',
          isIOS: isIOS,
        ),
        AppTextField(
          cupertinoIcon: FontAwesomeIcons.hashtag,
          materialIcon: FontAwesomeIcons.hashtag,
          hintText: 'Available Units',
          isIOS: isIOS,
        ),
        AppButton(
          buttonType: ButtonType.Straw,
          buttonText: 'Add Image',
        ),
        AppButton(
          buttonType: ButtonType.DarkBlue,
          buttonText: 'Save Product',
        ),
      ],
    );
  }
}
