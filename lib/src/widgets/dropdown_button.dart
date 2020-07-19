import 'package:farmersmarket/src/styles/base.dart';
import 'package:farmersmarket/src/styles/buttons.dart';
import 'package:farmersmarket/src/styles/colors.dart';
import 'package:farmersmarket/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AppDropDownButton extends StatelessWidget {
  final List<String> items;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final String value;
  final Function(String) onChanged;

  const AppDropDownButton(
      {Key key,
      @required this.items,
      @required this.hintText,
      this.materialIcon,
      this.cupertinoIcon,
      this.value,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Padding(
        padding: BaseStyles.listPadding,
        child: Container(
          height: ButtonsStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.straw, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 35.0,
                child: BaseStyles.iconPrefix(materialIcon),
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    child: (value == null) ? Text(
                      hintText,
                      style: TextStyles.suggestion,
                    ) : Text(
                      value,
                      style: TextStyles.body,
                    ),
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return _selectIOS(context, items);
                          });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: BaseStyles.listPadding,
        child: Container(
          height: ButtonsStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.straw, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 35.0,
                child: BaseStyles.iconPrefix(materialIcon),
              ),
              Expanded(
                child: Center(
                  child: DropdownButton<String>(
                    items: buildMaterialItems(items),
                    value: value,
                    hint: Text(
                      hintText,
                      style: TextStyles.suggestion,
                    ),
                    style: TextStyles.body,
                    underline: Container(),
                    iconEnabledColor: AppColors.straw,
                    onChanged: (value) => onChanged(value),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  List<DropdownMenuItem<String>> buildMaterialItems(List<String> items) {
    return items
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, textAlign: TextAlign.center),
            ))
        .toList();
  }

  List<Widget> buildCupertinoItems(List<String> items) {
    return items
        .map((item) => Text(
              item,
              textAlign: TextAlign.center,
              style: TextStyles.picker,
            ))
        .toList();
  }

  _selectIOS(BuildContext context, List<String> items) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.white,
        height: 200.0,
        child: CupertinoPicker(
          itemExtent: 45.0,
          children: buildCupertinoItems(items),
          diameterRatio: 1.0,
          onSelectedItemChanged: (int index) => onChanged(items[index]),
        ),
      ),
    );
  }
}
