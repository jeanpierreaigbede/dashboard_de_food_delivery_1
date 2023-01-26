import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/models/restaurant.dart';
import 'package:dashboard/screens/homepage.dart';
import 'package:dashboard/screens/restaurants/dashBoardPage.dart';
import 'package:dashboard/screens/restaurants/register.dart';
import 'package:dashboard/utils/appColors.dart';
import 'package:dashboard/utils/responsive_Layout.dart';
import 'package:dashboard/utils/restaurant_uid.dart';
import 'package:dashboard/widget/bigText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/responsive/desktop_scaffold.dart';
import '../screens/responsive/mobile_scafffold.dart';
import '../screens/responsive/tablette_scaffold.dart';
import '../utils/dimensions.dart';
import '../widget/smallText.dart';

class AuthController extends GetxController {
  String collectionReference = "Restaurants";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<bool> loading = Rx<bool>(false);
  //register

  Future<void> registerRestaurent(String email,
      String name, String password,
      String telephone,
      String adresse,
      String description,
      List<String?> imageUrls
      ) async {
    loading.value=true;
    firestore
        .collection(collectionReference)
        .where("email", isEqualTo: email)
        .get()
        .then((event) async {
      if (event.size >= 1) {
        print("Le document exist");
      } else {
        print("le document n'existe Donc on cré le compte");
        try {
          UserCredential userCredential = await auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .catchError((error) {
            print(error.toString());
          });
          if (userCredential.user!.uid != null) {
            Restaurant restaurant = Restaurant(id: userCredential.user!.uid,
                name: name,
                email: email,
                description: description,
                adresse: adresse,
                telephone: telephone,
                nombreVente: 0,
                restaurantImages: imageUrls);
            var restaurantMap = restaurant.toMap(restaurant);
            firestore
                .collection(collectionReference)
                .doc()
                .set(restaurantMap);

            Get.to(()=>ResponsiveLayout(MobileScaffold: MobileScaffold(),
                TabletteScaffold: TabletteScaffold(),
                DeskTopScaffold: DesktopScaffold()));
          }
          loading.value = false;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.defaultDialog(
                title: 'Erreur de mot passe',
                content: SmallText(text: "Le mot de passe est trop faible",),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.widtht10,
                    vertical: Dimensions.height5),
                actions: [
                  TextButton(onPressed: () {
                    Get.back();
                  }, child: SmallText(text: "OK", color: Colors.red,))
                ]
            );
          } else if (e.code == 'email-already-in-use') {
            print('je suis ici dans l\'email déja utilisé');
            Get.defaultDialog(
                title: 'Erreur',
                content: SmallText(
                  text: "Vous ne pouvez plus utiliser cet email puisqu'il est déja utilisé pour la création d'un compte d'utilisateur.",),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: Dimensions.widtht10,
                    vertical: Dimensions.height5),
                actions: [
                  TextButton(onPressed: () {
                    Get.back();
                  }, child: SmallText(text: "Ok", color: Colors.red,))
                ]
            );
          }
        }
      }
    });

    /*     if(value.docs.length >= 1)
            {
             exist = true;
            }else{
            try {
              UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password).catchError((error){print(error.toString());});
              if(userCredential.user!.uid != null){
                Restaurant restaurant = Restaurant(id: userCredential.user!.uid, name: name, email: email, description: description, adresse: adresse, telephone: telephone,nombreVente: 0,restaurantImages: []);
                var restaurantMap = restaurant.toMap(restaurant);
                firestore
                    .collection(collectionReference)
                    .doc()
                    .set(restaurantMap);
              }
            } on FirebaseAuthException catch (e) {
              if(e.code == 'weak-password'){
                Get.defaultDialog(
                    title: 'Erreur de mot passe',
                    content: SmallText(text: "Le mot de passe est trop faible",),
                    contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
                    actions: [
                      TextButton(onPressed: (){Get.back();}, child: SmallText(text: "OK",color: Colors.red,))
                    ]
                );
              }else if(e.code == 'email-already-in-use'){
                Get.defaultDialog(
                    title: 'Erreur',
                    content: SmallText(text: "Vous ne pouvez plus utiliser cet email puisqu'il est déja utilisé pour la création d'un compte d'utilisateur.",),
                    contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
                    actions: [
                      TextButton(onPressed: (){
                        Get.back();
                      }, child: SmallText(text: "Ok",color: Colors.red,))
                    ]
                );
              }
            }
          }*/


  }


  // Sign In

  Future<void> signIn(String email, String password) async {
    try {
      Get.snackbar(
          "Connexion", "Loading...",
          showProgressIndicator: true,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(minutes: 1)
      );

          firestore.collection(collectionReference)
          .where("email",isEqualTo: email)
          .get()
          .then((event) async{
            if(event.size >= 1 ){
              try {
                UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
                if(userCredential.user!.uid != null){
                  RestaurantUid.restaurantUid = userCredential.user!.uid;
                  Get.to(()=>DashBoardPage(),transition: Transition.rightToLeftWithFade);
                }
              } on FirebaseAuthException catch (e) {
                Get.back();
                 if (e.code == 'wrong-password') {
                  Get.defaultDialog(
                      title: 'Erreur',
                      content: SmallText(text: "Mot de passe incorrect",),
                      contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
                      actions: [
                        TextButton(onPressed: (){Get.back();}, child: SmallText(text: "OK",color: Colors.red,))
                      ]
                  );
                }
              }

            }else{
              Get.defaultDialog(
                title: "Erreur",
                content: BigText(text: "Aucun restaurants n'est encore relié à ce email"),
                actions: [
                  TextButton(onPressed: (){Get.back();}, child: BigText(text: "OK",color: AppColors().mainColor,size: Dimensions.fontText20,)),
                  TextButton(onPressed: (){Get.to(()=>RegisterResaturant(),transition: Transition.zoom);}, child: BigText(text: "Enregistrer votre restaurant",color: AppColors().mainColor,))
                ]
              );
            }
          });
    } on FirebaseAuthException catch (e) {

    }
  }
  sigout(){
    auth.signOut();
    Get.to(()=>HomePage());
  }
}

