import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/controllers/authController.dart';
import 'package:dashboard/screens/auth.dart';
import 'package:dashboard/utils/appColors.dart';
import 'package:dashboard/utils/dimensions.dart';
import 'package:dashboard/widget/bigText.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../utils/restaurant_uid.dart';
import '../../widget/appButton.dart';
import '../../widget/smallText.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'package:image_picker/image_picker.dart';

class RegisterResaturant extends StatefulWidget {
  const RegisterResaturant({Key? key}) : super(key: key);

  @override
  State<RegisterResaturant> createState() => _RegisterResaturantState();
}

class _RegisterResaturantState extends State<RegisterResaturant> {
  TextEditingController restaurantController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController descriptionController =TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // images
   Uint8List? image1;
  Uint8List? image2 ;
  Uint8List? image3 ;
  List<Uint8List?> pickedImagesInBytes = [];
  String? url1,url2,url3;
  List<String?> imageUrls =[];
  bool loading = false;
  AuthController authController = Get.find();
  @override
  void dispose() {
    restaurantController.dispose();
    emailController.dispose();
    adresseController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    descriptionController.dispose();
    phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: AppColors().mainColor,
        leading: Container(),
        title: BigText(text: "Enregistrement d'un restaurant",color: Colors.white,size: Dimensions.fontText20,),
        centerTitle: true,
      ),*/
      body: SafeArea(
        child: Center(
          child: Column(

            children: [
              Stack(
                children: [
                  Container(
                    height: Dimensions.screenHeight*0.3,
                    width: Dimensions.screenwidth,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/3.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Container(
                      height: Dimensions.height45,
                      margin: EdgeInsets.only(top: Dimensions.height100,right: Dimensions.widtht15,left: Dimensions.widtht15),
                      alignment: Alignment.center,
                      color: Colors.red.withOpacity(0.5),
                      child: BigText(text: "Enregistrement d'un restaurant",color: Colors.white,size: Dimensions.fontText20,)),
                ],
              ),
              SizedBox(height: Dimensions.height10,),
              Expanded(
                child: SingleChildScrollView(

                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal: Dimensions.widtht15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Dimensions.height45,
                              width: Dimensions.screenwidth*0.45,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: restaurantController,
                                cursorColor: AppColors().mainColor,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.restaurant,color: AppColors().textColor,),
                                    filled: true,
                                    fillColor: AppColors().secondColor,
                                    border: InputBorder.none,
                                    hintText: "Nom du restaurant",
                                    hintStyle: TextStyle(
                                        fontSize: Dimensions.fontText15,
                                        color: AppColors().mainColor,
                                        fontWeight: FontWeight.w500
                                    )
                                  //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                                ),
                              ),
                            ),
                            Container(
                              height: Dimensions.height45,
                              width: Dimensions.screenwidth*0.45,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: adresseController,
                                cursorColor: AppColors().mainColor,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.place,color: AppColors().textColor,),
                                    filled: true,
                                    fillColor: AppColors().secondColor,
                                    border: InputBorder.none,
                                    hintText: "Adresse du restaurant",
                                    hintStyle: TextStyle(
                                        fontSize: Dimensions.fontText15,
                                        color: AppColors().mainColor,
                                        fontWeight: FontWeight.w500
                                    )
                                  //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: Dimensions.height45,
                              width: Dimensions.screenwidth*0.45,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: emailController,
                                //maxLines: 5,
                                cursorColor: AppColors().mainColor,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,

                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email,color: AppColors().textColor,),
                                    filled: true,
                                    fillColor: AppColors().secondColor,
                                    border: InputBorder.none,
                                    hintText: "Email du restaurant",
                                    hintStyle: TextStyle(
                                        fontSize: Dimensions.fontText15,
                                        color: AppColors().mainColor,
                                        fontWeight: FontWeight.w500
                                    )
                                  //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                                ),
                              ),
                            ),
                            Container(
                              height: Dimensions.height45,
                              width: Dimensions.screenwidth*0.45,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: phoneController,
                                cursorColor: AppColors().mainColor,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone,color: AppColors().textColor,),
                                    filled: true,
                                    fillColor: AppColors().secondColor,
                                    border: InputBorder.none,
                                    hintText: "télephone",
                                    hintStyle: TextStyle(
                                        fontSize: Dimensions.fontText15,
                                        color: AppColors().mainColor,
                                        fontWeight: FontWeight.w500
                                    )
                                  //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.height10,),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: descriptionController,
                          cursorColor: AppColors().mainColor,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                          ),
                          maxLines: 5,
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.restaurant,color: AppColors().textColor,),
                              filled: true,
                              fillColor: AppColors().secondColor,
                              border: InputBorder.none,
                              hintText: "Description du restaurant .",
                              hintStyle: TextStyle(
                                  fontSize: Dimensions.fontText15,
                                  color: AppColors().mainColor,
                                  fontWeight: FontWeight.w500
                              )
                            //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                          ),
                        ),
                        SizedBox(height: Dimensions.height10,),

                        SizedBox(height: Dimensions.height10,),
                        Container(
                            alignment: Alignment.center,
                            height: Dimensions.height100*2.5,
                            width: Dimensions.screenwidth*0.95,
                            padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal: Dimensions.widtht10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht10*0.5)),
                                color: AppColors().secondColor
                            ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: Dimensions.height100*1.5,
                                    width: Dimensions.height100*1.7,
                                    color: Colors.red,
                                    child: image1!=null ? Image.memory(image1!,fit: BoxFit.cover,):Image.asset("assets/images/picture.png",fit: BoxFit.cover,),
                                  ),
                                  Container(
                                    height: Dimensions.height100*1.5,
                                    width: Dimensions.height100*1.7,
                                    color: Colors.red,
                                    child: image2!=null ? Image.memory(image2!,fit: BoxFit.cover,):Image.asset("assets/images/picture.png",fit: BoxFit.cover,),
                                  ),
                                  Container(
                                    height: Dimensions.height100*1.5,
                                    width: Dimensions.height100*1.7,
                                   // color: Colors.red,
                                    child: image3!=null ? Image.memory(image3!,fit: BoxFit.cover,):Image.asset("assets/images/picture.png",fit: BoxFit.cover,),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: Dimensions.widtht10*1.5,),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors().mainColor,
                                        padding: EdgeInsets.all(Dimensions.widtht10*0.2),
                                      elevation: 10
                                    ),
                                      onPressed: (){
                                      selectFiles();
                                      }, child: BigText(text: "Selectionner les images",color: Colors.white,)),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors().mainColor,
                                          elevation: 10,
                                        padding: EdgeInsets.all(Dimensions.widtht10*0.3)
                                      ),
                                      onPressed: (){
                                        uploadMultipleFiles();
                                      }, child:loading?Center(child: CircularProgressIndicator(color: Colors.white,),) : BigText(text: " upload les images",color: Colors.white,)),
                                  SizedBox(height: Dimensions.widtht10*1.5,),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height10,),
                        TextField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          cursorColor: AppColors().mainColor,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: AppColors().textColor,),
                              filled: true,
                              fillColor: AppColors().secondColor,
                              border: InputBorder.none,
                              hintText: "Mot de passe",
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
                          controller: confirmPassword,
                          cursorColor: AppColors().mainColor,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock,color: AppColors().textColor,),
                              filled: true,
                              fillColor: AppColors().secondColor,
                              border: InputBorder.none,
                              hintText: "Confirmer mot de passe",
                              hintStyle: TextStyle(
                                  fontSize: Dimensions.fontText15,
                                  color: AppColors().mainColor,
                                  fontWeight: FontWeight.w500
                              )
                            //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                          ),
                        ),
                        SizedBox(height: Dimensions.height20,),
                        InkWell(
                          onTap: ()async{
                            if(validText(restaurantController.text) && validText(emailController.text)
                                && validText(passwordController.text.trim()) && validText(confirmPassword.text.trim())&& validText(descriptionController.text)
                                && validText(phoneController.text) && imageUrls.length==3 && validText(adresseController.text)){
                              if(passwordController.text.trim() != confirmPassword.text.trim()){
                                Get.snackbar(
                                    "Validation", "Veuillez convenablement remplir tous les champs .",
                                    titleText: BigText(text: "Validation",color: Colors.white,),
                                    messageText: Text("Les mots de passe ne se correspondent pas",style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions.fontText20
                                    ),),
                                    backgroundColor: AppColors().textColor,
                                    margin: EdgeInsets.only(top: 40),
                                    padding: EdgeInsets.all(15)
                                );
                              }
                              else{
                                FirebaseFirestore firestore = FirebaseFirestore.instance;

                                // every thing is up
                              await authController.registerRestaurent(emailController.text, restaurantController.text,
                                  passwordController.text.trim(), phoneController.text, adresseController.text,
                                  descriptionController.text,imageUrls);
                              }
                            }else{
                              Get.snackbar(
                                  "Validation", "Veuillez convenablement remplir tous les champs .",
                                  titleText: BigText(text: "Validation",color: Colors.white,),
                                  messageText: Text("Veuillez convenablement remplir tous les champs .Sans oublier d'uploader les images",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Dimensions.fontText20
                                  ),),
                                  backgroundColor: AppColors().textColor,
                                margin: EdgeInsets.only(top: 40),
                                padding: EdgeInsets.all(15)
                              );
                            }
                          },
                            child: AppButton(child: authController.loading.value?Center(child: CircularProgressIndicator(color: Colors.white,),):BigText(text: "Enregistrer",color: Colors.white,size: Dimensions.fontText20,),width: Dimensions.screenwidth*0.5,backgroung: AppColors().mainColor,)),

                        SizedBox(height: Dimensions.height10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmallText(text: "Avez-vous déja enregistrer votre restaurant?",size: Dimensions.fontText15*0.6,),
                            SizedBox(width: Dimensions.widtht15,),
                            TextButton(onPressed: (){
                              Get.to(()=>SignIn(type: 1));
                            }, child: SmallText(text: "Accédez au dashboard",color: AppColors().mainColor,size: Dimensions.fontText15*0.7,))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  uploadPictures()async{

  }

  bool validText(String string){
    if(string.isNotEmpty && string != ""){
      return true;
    }
    else{
      return false;
    }
  }

  register(String email,String name, String password, String telephone,String adresse,String description )async{

  }

  selectFiles()async{

      FilePickerResult? fileResult =
      await FilePicker.platform.pickFiles(allowMultiple: true);

      if (fileResult != null && fileResult.files.length>=3) {

        fileResult.files.forEach((element) {
          setState(() {
            pickedImagesInBytes.add(element.bytes);
            //selectedImageInBytes = fileResult.files.first.bytes;
          });
        });
        setState(() {
          image1 = pickedImagesInBytes[0];
          image2 = pickedImagesInBytes[1];
          image3 = pickedImagesInBytes[2];
        });
      }else{
        Get.defaultDialog(
            title: "",
            content: BigText(text: "Veuillez selectionner trois images"),
            contentPadding: EdgeInsets.all(Dimensions.widtht10),
            actions: [TextButton(onPressed: (){Get.back();}, child: BigText(text: "OK",color: AppColors().mainColor,))]

        );

    }
  }
    uploadMultipleFiles() async {
    setState(() {
      loading = true;
    });
    String imageUrl = '';
    final datetime = DateTime.now().toString();
    try {
      if(pickedImagesInBytes.length>=3)
      {
        for (var i = 0; i < 3; i++) {

          firebase_storage.UploadTask uploadTask;

          var ref = firebase_storage
              .FirebaseStorage.instance
              .ref()
              .child('Restaurants')
              .child('/' +datetime+ '_' + i.toString());

          final metadata =
          firebase_storage.SettableMetadata(contentType: 'image/jpeg');

          //uploadTask = ref.putFile(File(file.path));
          uploadTask = ref.putData(pickedImagesInBytes[i]!, metadata);

          await uploadTask.whenComplete(() => null);
          imageUrl = await ref.getDownloadURL();
          print("url: $imageUrl");
          setState(() {
            imageUrls.add(imageUrl);
          });
        }
        setState(() {
          loading = false;
        });
        if(imageUrls.length==3){

        }else{
          Get.snackbar("une erreur s'est produite", "les images n'ont été upload dans la base de données. Veuillez réésayer.");
        }

      } else{
      Get.defaultDialog(
        title: "",
        content: BigText(text: "Veuillez selectionner trois images"),
        contentPadding: EdgeInsets.all(Dimensions.widtht10),
        actions: [TextButton(onPressed: (){Get.back();}, child: BigText(text: "OK",color: AppColors().mainColor,))]

      );
    }
    } catch (e) {
      print(e);
    }
  }

}
