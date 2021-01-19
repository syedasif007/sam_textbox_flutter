library sam_textbox_flutter;

import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/icons.dart';

class SamTextBox extends StatefulWidget {
  final bool isEnabled;
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final EdgeInsets padding;
  final Color primaryColor;
  final Color primaryColorDark;
  final Color borderColor;
  final IconData suffixIcon;
  final Function(String) onChanged;
  final Function(String) validator;

  SamTextBox({
    Key key,
    @required this.isEnabled,
    @required this.controller,
    @required this.hintText,
    @required this.errorText,
    @required this.padding,
    this.primaryColor,
    this.primaryColorDark,
    this.borderColor,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  }) : super(key: key);
  @override
  _SamTextBoxState createState() => _SamTextBoxState();
}

class _SamTextBoxState extends State<SamTextBox> {
  @override
  Widget build(BuildContext context) {
    IconData _suffixIcon =
        widget.suffixIcon == null ? ACCEPT_ICON : widget.suffixIcon;
    Color _borderColor =
        widget.borderColor == null ? COLOR_GREEN : widget.borderColor;
    assert(context != null, "context is null!");
    assert(widget.isEnabled != null, "isEnabled is null!");
    assert(widget.controller != null, "controller is null!");
    assert(widget.hintText != null, "hintText is null!");
    assert(widget.errorText != null, "errorText is null!");
    assert(widget.padding != null, "padding is null!");
    return SafeArea(
      child: Container(
        padding: widget.padding,
        child: Theme(
          data: new ThemeData(
            primaryColor: widget.primaryColor == null
                ? DEFAULT_COLOR
                : widget.primaryColor,
            primaryColorDark: widget.primaryColorDark == null
                ? DEFAULT_COLOR_DARK
                : widget.primaryColorDark,
          ),
          child: TextFormField(
            enabled: widget.isEnabled,
            validator: widget.validator,
            onChanged: widget.onChanged,
            controller: widget.controller,
            autocorrect: true,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            // onEditingComplete: () => node.nextFocus(),
            // obscureText: isPassword,
            decoration: new InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: COLOR_RED, width: 2.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: COLOR_RED, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _borderColor, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: _borderColor, width: 2.0),
              ),
              hintText: widget.hintText,
              suffixIcon: Icon(
                _suffixIcon,
                color: _borderColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
