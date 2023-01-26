import 'package:dashboard/screens/restaurants/AddFood.dart';
import 'package:dashboard/screens/restaurants/orders.dart';
import 'package:dashboard/widget/bigText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appColors.dart';
import '../../utils/dimensions.dart';


class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: Dimensions.height100,
              color: AppColors().mainColor,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(text: "DASHBOARD",color: Colors.white,size: Dimensions.fontText20,),
                  Row(
                    children: [
                      TextButton(onPressed: (){
                        Get.to(()=>Accueil(),transition: Transition.rightToLeft);
                      },
                          child: BigText(text: "Accueil",color: Colors.white,size: Dimensions.fontText15,)),
                      TextButton(onPressed: (){
                        Get.to(()=>AddFood(),transition: Transition.rightToLeft);
                      },
                          child: BigText(text: "Ajouter un produit",color: Colors.white,size: Dimensions.fontText15,)),
                      TextButton(onPressed: (){
                        Get.to(()=>Orders(),transition: Transition.zoom);
                      },
                          child: BigText(text: "Commandes en cours",color: Colors.white,size: Dimensions.fontText15,)),
                      TextButton(onPressed: (){},
                          child: BigText(text: "Se deconnecter",color: Colors.white,size: Dimensions.fontText15,))
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 10,),
            Expanded(child: Center(child:BigText(text: "Bienvenu",),))

          ],
        ),
      ),
    );
  }
}
