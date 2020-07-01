import 'package:farmersmarket/src/styles/text.dart';
import 'package:farmersmarket/src/styles/text_fields_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTextField extends StatefulWidget {
  final bool isIOS;
  final String hintText;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final TextInputType textInputType;
  final bool obscureText;
  final void Function(String) onChanged;
  final String errorText;

  const AppTextField({
    Key key,
    @required this.isIOS,
    @required this.hintText,
    @required this.cupertinoIcon,
    @required this.materialIcon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  FocusNode _node;
  bool displayCupertinoErrorBorder;
  TextEditingController _controller;

  @override
  void initState() {
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
    _controller = TextEditingController();
    displayCupertinoErrorBorder=false;
    super.initState();
  }

  void _handleFocusChange(){
    if(_node.hasFocus == false && widget.errorText != null){
      displayCupertinoErrorBorder = true;
    }else{
      displayCupertinoErrorBorder = false;
    }

    widget.onChanged(_controller.text);
  }

  @override
  void dispose() {
    _node.removeListener(_handleFocusChange);
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: TextFieldsStyles.textBoxHorizontal, vertical: TextFieldsStyles.TextBoxVertical),
        child: Column(
          children: <Widget>[
            CupertinoTextField(
              controller: _controller,
              keyboardType: widget.textInputType,
              padding: EdgeInsets.all(12.0),
              placeholder: widget.hintText,
              placeholderStyle: TextFieldsStyles.placeHolder,
              style: TextFieldsStyles.text,
              textAlign: TextFieldsStyles.textAlign,
              cursorColor: TextFieldsStyles.cursorColor,
              decoration: displayCupertinoErrorBorder ? TextFieldsStyles.cupertinoErrorDecoration : TextFieldsStyles.cupertinoDecoration,
              prefix: TextFieldsStyles.iconPrefix(widget.cupertinoIcon),
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              focusNode: _node,
            ),
            (widget.errorText != null) ? Padding(
              padding: const EdgeInsets.only(top:5.0, left: 10),
              child: Row(
                children: <Widget>[
                  Text(widget.errorText, style: TextStyles.error,),
                ],
              ),
            ): Container(),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: TextFieldsStyles.textBoxHorizontal, vertical: TextFieldsStyles.TextBoxVertical),
        child: TextField(
          keyboardType: widget.textInputType,
          cursorColor: TextFieldsStyles.cursorColor,
          style: TextFieldsStyles.text,
          textAlign: TextFieldsStyles.textAlign,
          decoration: TextFieldsStyles.materialDecoration(
            widget.hintText,
            widget.materialIcon,
            widget.errorText,
          ),
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
        ),
      );
    }
  }
}
