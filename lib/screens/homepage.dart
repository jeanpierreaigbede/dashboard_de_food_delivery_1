import 'dart:async';

import 'package:dashboard/screens/choice.dart';
import 'package:dashboard/screens/restaurants/register.dart';
import 'package:dashboard/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import '../widget/bigText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(milliseconds: 2000),()=>Get.to(()=>ChoicePage()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigText(text: "Bienvenue au portail de Food Delivery,",size: Dimensions.fontText15,color: AppColors().mainColor,),
                SizedBox(height: Dimensions.height10,),
                Container(
                  height: Dimensions.height100*2,
                  width: Dimensions.widtht45*4,
                  decoration:const  BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/first.jpg"),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                BigText(text: "Food delivery ...",color: Colors.red,size: Dimensions.fontText15,)
              ],
            ),
          ),
        )


    );
  }
}

