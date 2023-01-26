import 'package:dashboard/screens/restaurants/accueil.dart';
import 'package:flutter/material.dart';

import '../../utils/appColors.dart';
import '../../utils/constants.dart';
import '../../utils/dimensions.dart';
import '../../widget/bigText.dart';
import '../restaurants/AddFood.dart';
import '../restaurants/orders.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  int index = 0;
  List<Widget> pages = [
    Accueil(),
    AddFood(),
    Orders(),
  ];
  @override
  Widget build(BuildContext context) {
    return Accueil();
  }
}/* Scaffold(
      backgroundColor: Colors.green,
      body:

      /*Row(
        children: [

              Container(
                width: Dimensions.screenwidth*0.3,
                height: double.infinity,
                child: Drawer(
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
              ),
          pages[index]
        ]
      ),*/
    );
  }
}*/
