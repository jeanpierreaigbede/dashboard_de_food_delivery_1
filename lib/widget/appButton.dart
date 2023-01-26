import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import 'package:dashboard/utils/dimensions.dart';


class AppButton extends StatelessWidget {
  Widget? child;
  double width ;
  final Color backgroung;
  AppButton({Key? key,required this.child ,this.backgroung = const Color(0xff3b3b3b), this.width = 200 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height5,horizontal: Dimensions.widtht10),
      alignment: Alignment.center,
      height: Dimensions.height45,
      width: width,
      decoration: BoxDecoration(
        color: backgroung,
        boxShadow: [
          BoxShadow(color: AppColors().textColor,blurRadius: 1.3,offset: Offset(1,1) )
        ],
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30)),
      ),
      child: child,
    );
  }
}