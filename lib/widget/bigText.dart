import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  String text;
  Color color ;
  double size;
  BigText({Key? key,required this.text,this.color = const Color(0xff3b3b3b), this.size = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: size,
          overflow: TextOverflow.visible,
          color: color,
          decoration: TextDecoration.none
      ),
    );
  }
}
