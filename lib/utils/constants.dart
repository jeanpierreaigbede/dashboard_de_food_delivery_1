import 'package:dashboard/utils/appColors.dart';
import 'package:dashboard/utils/dimensions.dart';
import 'package:dashboard/widget/bigText.dart';
import 'package:flutter/material.dart';

var myAppbar = AppBar();

var myDrawer = Drawer(
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
                  leading: Icon(Icons.home,color: AppColors().mainColor,size: Dimensions.fontText20),
                  title: BigText(text: "Accueil",size: Dimensions.fontText20,color: AppColors().mainColor),
                ),
                SizedBox(height: Dimensions.height10,),
                ListTile(
                  leading: Icon(Icons.food_bank,color: AppColors().mainColor,size: Dimensions.fontText20),
                  title: BigText(text: "Ajouter de nouveau nouriture",size: Dimensions.fontText20,color: AppColors().mainColor),
                ),
                SizedBox(height: Dimensions.height10,),
                ListTile(
                  leading: Icon(Icons.keyboard_command_key,color: AppColors().mainColor,size: Dimensions.fontText20),
                  title: BigText(text: "Les commandes en cours",size: Dimensions.fontText20,color: AppColors().mainColor,),
                ),
                SizedBox(height: Dimensions.height10,),
                ListTile(
                  leading: Icon(Icons.logout,color: AppColors().mainColor,size: Dimensions.fontText20),
                  title: BigText(text: "Se deconnecter",size: Dimensions.fontText20,color: AppColors().mainColor),
                )
              ],
            ),
          ))
    ],
  ),
);
