import 'package:dashboard/controllers/authController.dart';
import 'package:dashboard/screens/restaurants/register.dart';
import 'package:dashboard/utils/appColors.dart';
import 'package:dashboard/widget/bigText.dart';
import 'package:dashboard/widget/smallText.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../widget/appButton.dart';
import 'package:get/get.dart';


class SignIn extends StatefulWidget {
  int? type;
  SignIn({Key? key, required this.type}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = Get.put(AuthController(),permanent: true);
  void dispose(){
    super.dispose();
    passwordController.clear();
    emailController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().mainColor,
        centerTitle: true,
        title: BigText(text: "Page connexion", color: Colors.white,size: Dimensions.fontText20,),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BigText(text: " Veuillez renseigner vos informations, afin de vous connecter", color: AppColors().mainColor,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.widtht45,vertical: Dimensions.height45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        cursorColor: AppColors().mainColor,
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email,color: AppColors().textColor,),
                            filled: true,
                            fillColor: AppColors().secondColor,
                            border: InputBorder.none,
                            hintText: "Votre email",
                            hintStyle: TextStyle(
                                fontSize: Dimensions.fontText15,
                                color: AppColors().mainColor,
                                fontWeight: FontWeight.w500
                            )
                          //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      TextField(
                        keyboardType: TextInputType.text,
                        obscureText: isObscure,
                        controller: passwordController,
                        cursorColor: AppColors().mainColor,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: Dimensions.fontText20
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors().secondColor,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock,color: AppColors().textColor,),
                            suffixIcon: InkWell(
                                onTap:togleVisiblePassword,
                                child: Icon(isObscure?Icons.visibility_off_outlined:Icons.visibility_outlined,color: isObscure?AppColors().textColor:AppColors().mainColor,size: Dimensions.height30,)
                            ),
                            hintText: "Votre mot de passe",
                            hintStyle: TextStyle(
                              fontSize: Dimensions.fontText15,
                              color: AppColors().mainColor,
                              fontWeight: FontWeight.w500,

                            )
                          //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    if(validText(emailController.text.trim()) && validText(passwordController.text.trim()))
                      {
                        authController.signIn(emailController.text.trim(), passwordController.text.trim());
                      }else{
                      Get.defaultDialog(
                        title: 'Erreur',
                        content: BigText(text: "Veuillez convenablement remplir tous les champs"),
                        actions: [TextButton(onPressed: (){Get.back();}, child: BigText(text: 'OK',color: AppColors().mainColor,))]
                      );
                    }
                  },

                    child: AppButton(child: BigText(text: "Se connecter",color: Colors.white,size: Dimensions.fontText20,),width: Dimensions.screenwidth*0.5,backgroung: AppColors().mainColor,)
                ),

                SizedBox(height: Dimensions.height10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "N'avez-vous pas encore enregistrer votre restaurants?"),
                    SizedBox(width: Dimensions.widtht15,),
                    TextButton(onPressed: (){Get.to(()=>RegisterResaturant());},
                        child: SmallText(text: "Enregistrer votre restaurant",color: AppColors().mainColor,))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togleVisiblePassword(){
    setState(() {
      isObscure = !isObscure;
    });
  }
  bool validText(String string){
    if(string.isNotEmpty && string != ""){
      return true;
    }
    else{
      return false;
    }
  }
}

