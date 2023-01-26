import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/screens/restaurants/accueil.dart';
import 'package:dashboard/screens/restaurants/orders.dart';
import 'package:dashboard/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/appColors.dart';
import '../../utils/dimensions.dart';
import '../../widget/bigText.dart';
import '../restaurants/AddFood.dart';


class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body:Accueil(),
      drawer: Drawer(
        backgroundColor: AppColors().secondColor,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: Dimensions.height100*3,
              color: AppColors().mainColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.restaurant_menu,color: Colors.white,size: Dimensions.height45,),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "D A S H B O A R D",color: Colors.white,size: Dimensions.fontText20,)
                ],
              ),
            ),
            const Divider(color: Colors.grey,height: 2,),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          setState(() {
                            index = 0;
                          });
                        },
                        leading: Icon(Icons.home,color: AppColors().mainColor,size: Dimensions.fontText20),
                        title: BigText(text: "Accueil",size: Dimensions.fontText20,color: AppColors().mainColor),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      ListTile(
                        onTap: (){
                          setState(() {
                            index = 1;
                          });
                        },
                        leading: Icon(Icons.food_bank,color: AppColors().mainColor,size: Dimensions.fontText20),
                        title: BigText(text: "Ajouter de nouveau nouriture",size: Dimensions.fontText20,color: AppColors().mainColor),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      ListTile(
                        onTap: (){
                          setState(() {
                            index = 2;
                          });
                        },
                        leading: Icon(Icons.keyboard_command_key,color: AppColors().mainColor,size: Dimensions.fontText20),
                        title: BigText(text: "Les commandes en cours",size: Dimensions.fontText20,color: AppColors().mainColor,),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      ListTile(
                        onTap: (){

                        },
                        leading: Icon(Icons.logout,color: AppColors().mainColor,size: Dimensions.fontText20),
                        title: BigText(text: "Se deconnecter",size: Dimensions.fontText20,color: AppColors().mainColor),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
