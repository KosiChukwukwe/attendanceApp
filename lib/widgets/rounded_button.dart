import 'package:flutter/material.dart';
import 'constant.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback?  press;
  final Color? color, textColor;
  final  double fontSize;
  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color = kgreen,
    this.textColor = Colors.white,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        
        child: FlatButton(
          disabledColor: Colors.grey,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          color: color,
          
          onPressed: press,
          child: Text(
            text!,
            style: TextStyle(color: textColor,
            fontSize: fontSize ),
          ),
        ),
      ),
    );
  }
}
