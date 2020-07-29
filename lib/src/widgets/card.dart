import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCard extends StatelessWidget {
  final formatCurrency = NumberFormat.simpleCurrency();

  final String productName;
  final String unitType;
  final int availableUnits;
  final double price;
  final String note;

  AppCard(
      {Key key,
      @required this.productName,
      @required this.unitType,
      @required this.availableUnits,
      @required this.price,
      this.note = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: BaseStyles.listPadding,
      padding: BaseStyles.listPadding,
      decoration: BoxDecoration(
        boxShadow: BaseStyles.boxShadow,
        color: Colors.white,
        border: Border.all(
          color: AppColors.darkBlue,
          width: BaseStyles.borderWidth,
        ),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
                child: Image.asset(
                  'assets/images/vegetables.png',
                  height: 100,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    productName,
                    style: TextStyles.subTitle,
                  ),
                  Text(
                    '${formatCurrency.format(price)}/$unitType',
                    style: TextStyles.body,
                  ),
                  (availableUnits > 0)
                      ? Text(
                          'In Stock',
                          style: TextStyles.bodyLightBlue,
                        )
                      : Text(
                          'Currently Unavailable',
                          style: TextStyles.bodyRed,
                        ),
                ],
              ),
            ],
          ),
          Text(
            note,
            style: TextStyles.body,
          ),
        ],
      ),
    );
  }
}
