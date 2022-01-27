import 'package:flutter/material.dart';
import 'constant.dart';

class TextFieldContainer extends StatefulWidget {
  final bool? ispasswordField;
  final bool showPassword;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType? inputType; 
  final TextInputAction? inputAction;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;

  const TextFieldContainer({
    Key? key,
    this.ispasswordField = false,
    this.showPassword = true,
    this.onChanged,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputType,
    this.inputAction,
    this.autovalidateMode,
    this.initialValue,
  }) : super(key: key);

  @override
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  // bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: TextFormField(
        obscureText: widget.showPassword,
        
        onChanged: widget.onChanged,
        cursorColor: kgrey,
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.ispasswordField! ? widget.suffixIcon : Container(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kgrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kgrey),
          ),
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kred),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kred),
          ),
        ),
      ),
    );
  }
}
