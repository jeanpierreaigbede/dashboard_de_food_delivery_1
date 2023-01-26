import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  String text;
  Color color;
  double size ;
  SmallText({Key? key, required this.text, this.color = Colors.black,this.size = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size
      ),
    );
  }
}