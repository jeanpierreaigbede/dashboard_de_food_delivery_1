
import 'package:dashboard/screens/auth.dart';
import 'package:dashboard/utils/appColors.dart';
import 'package:dashboard/widget/bigText.dart';
import 'package:dashboard/widget/appButton.dart';
import 'package:flutter/material.dart';
import '../../utils/dimensions.dart';
import 'package:get/get.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenwidth,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: (){
                    Get.to(()=>SignIn(type: 1));
                  },
                  child: AppButton(child: BigText(text: "Vendeur",color: Colors.white,size: Dimensions.fontText20,),width: Dimensions.screenwidth*0.4,backgroung: AppColors().mainColor,)),
              InkWell(
                  onTap: (){
                    Get.to(()=>SignIn(type: 2));
                  },
                  child: AppButton(child: BigText(text: "Delivreur",color:Colors.white,size: Dimensions.fontText20,),width: Dimensions.screenwidth*0.4,backgroung: AppColors().mainColor,)),
            ],
          ),
        ),
      ),
    );
  }
}
