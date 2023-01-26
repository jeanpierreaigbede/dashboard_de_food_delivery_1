



import 'dart:io';
import 'dart:typed_data';




import 'package:dashboard/models/custom_product.dart';
import 'package:dashboard/models/product.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dashboard/utils/dimensions.dart';
import 'package:dashboard/utils/restaurant_uid.dart';
import 'package:dashboard/widget/appButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';


import '../../utils/appColors.dart';
import '../../widget/bigText.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  bool? uploading ;
  File? _pickedImage ;
  Uint8List? webImage ;
  String? imageUrl;
  String dropValue = "Pétit Déjeuner";
  int _value = 2;
  TextEditingController nameproduct = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  //TextEditingController  = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
         /* height: double.infinity,
          width: double.infinity,*/
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(Dimensions.widtht10),
                  alignment: Alignment.center,
                  height: Dimensions.height45*2,
                 // width: double.infinity,
                  color: AppColors().mainColor,
                  child: BigText(text: "Nouveau Produits",color: Colors.white,size: Dimensions.fontText20,)
              ),
              SizedBox(height: Dimensions.height20,),
              Expanded(
                  child:  Container(
                    height: Dimensions.screenHeight*0.6,
                    //width: Dimensions.screenwidth,
                    padding:EdgeInsets.all(Dimensions.height20),
                    margin: EdgeInsets.all(Dimensions.height10),
                    child: SingleChildScrollView(
                        child:  Column(
                            children: [

                                /*height: double.infinity,
                                width: double.infinity,*/
                                  TextField(
                                  keyboardType: TextInputType.text,
                                  controller: nameproduct,
                                  cursorColor: AppColors().mainColor,
                                  style: const TextStyle(
                                    decoration: TextDecoration.none,
                                  ),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.restaurant,color: AppColors().textColor,),
                                      filled: true,
                                      fillColor: AppColors().secondColor,
                                      border: InputBorder.none,
                                      hintText: "Nom du produit",
                                      hintStyle: TextStyle(
                                          fontSize: Dimensions.fontText15,
                                          color: AppColors().mainColor,
                                          fontWeight: FontWeight.w500
                                      )
                                    //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                                  ),
                              ),
                              SizedBox(height: Dimensions.height20,),
                              TextField(
                                keyboardType: TextInputType.text,
                                controller: description,
                                cursorColor: AppColors().mainColor,
                                maxLines: 5,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                ),
                                decoration: InputDecoration(
                               //     prefixIcon: Icon(Icons.restaurant,color: AppColors().textColor,),
                                    filled: true,
                                    fillColor: AppColors().secondColor,
                                    border: InputBorder.none,
                                    hintText: "Description du produit",
                                    hintStyle: TextStyle(
                                        fontSize: Dimensions.fontText15,
                                        color: AppColors().mainColor,
                                        fontWeight: FontWeight.w500
                                    )
                                  //border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht30))),
                                ),
                              ),
                              SizedBox(height: Dimensions.height20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 45,
                                    width: Dimensions.height100*3,
                                    color: AppColors().secondColor,
                                    child: DropdownButton(
                                      style: const TextStyle(
                                        decoration: TextDecoration.none
                                      ),
                                      value: dropValue,
                                      icon: Icon(Icons.arrow_drop_down),
                                      items: [
                                        DropdownMenuItem(child: BigText(text: "Pétit Déjeuner",color: AppColors().mainColor,),value: "Pétit Déjeuner",),
                                        DropdownMenuItem(child: BigText(text: "Déjeuner",color: AppColors().mainColor,),value: "Déjeuner",),
                                        DropdownMenuItem(child: BigText(text: "Diner",color: AppColors().mainColor,),value:"Dinner" ,),
                                        DropdownMenuItem(child: BigText(text: "Thé",color: AppColors().mainColor,),value:"Thé"),
                                        DropdownMenuItem(child: BigText(text: "Jus",color: AppColors().mainColor,),value: "Jus",),
                                        DropdownMenuItem(child: BigText(text: "Fruits",color: AppColors().mainColor,),value: 'Fruits',),
                                        DropdownMenuItem(child: BigText(text: "Boissons",color: AppColors().mainColor,),value:"Boissons" ,),
                                      ],
                                      onChanged: (value){
                                        setState(() {
                                          dropValue = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.widtht45,),
                                  Expanded(
                                    child: TextField(
                                        keyboardType: TextInputType.text,
                                        controller: price,
                                        cursorColor: AppColors().mainColor,
                                        style: const TextStyle(
                                          decoration: TextDecoration.none,
                                        ),
                                        decoration: InputDecoration(
                                         //   prefixIcon: Icon(Icons.restaurant,color: AppColors().textColor,),
                                            filled: true,
                                            fillColor: AppColors().secondColor,
                                            border: InputBorder.none,
                                            hintText:  "Prix",
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
                              SizedBox(height: Dimensions.height20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: Dimensions.widtht30,),
                                  Container(
                                    height: Dimensions.height100*3,
                                    width: Dimensions.height100*3.3,
                                    decoration: BoxDecoration(
                                      color: AppColors().secondColor,
                                      border: Border.all(color: AppColors().mainColor,width: 1.5)
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: Dimensions.height100*2.2,
                                          width: Dimensions.height100*3.3,

                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/picture.png"),
                                              fit: BoxFit.cover
                                            )
                                          ),
                                          child: (webImage!=null)?Image.memory(webImage!):Image.asset("assets/images/picture.png",fit: BoxFit.cover,),
                                    //      child: Image.network("https://firebasestorage.googleapis.com/v0/b/food-delivery-brigth.appspot.com/o/ProductImages%2F2023-01-06%2020%3A31%3A31.962?alt=media&token=8667e23c-e94e-449e-8206-45a672a2ee89"),
                                      //  child: Image.network("https://firebasestorage.googleapis.com/v0/b/food-delivery-brigth.appspot.com/o/ProductImages%2F1673089720761000?alt=media&token=ed92ac49-88f4-46e3-b6af-3fef6146a561"),
                                        ),
                                        SizedBox(height: Dimensions.height10,),
                                        ElevatedButton(style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(Dimensions.widtht10*0.5),
                                          backgroundColor: AppColors().mainColor,
                                          elevation: 10,
                                        ),
                                            onPressed: (){

                                            //uploadToStorage();
                                            uploadImage();
                                             // uploadImage();
                                            }, child: BigText(text: "Ajouter une image",color: Colors.white,))
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.widtht30,),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          BigText(text: "Recommandé",color: AppColors().mainColor,size: Dimensions.fontText15,),
                                          SizedBox(width: Dimensions.widtht10,),
                                          Radio(
                                            activeColor: AppColors().mainColor,
                                              value: 1, groupValue: _value, onChanged: (value){
                                            setState(() {
                                              _value = value!;
                                            });
                                          })
                                        ],
                                      ),
                                      SizedBox(height: Dimensions.height10,),
                                      Row(
                                        children: [
                                          BigText(text: "Populaire",color: AppColors().mainColor,size: Dimensions.fontText15,),
                                          SizedBox(width: Dimensions.widtht10,),
                                          Radio(
                                              activeColor: AppColors().mainColor,value: 2, groupValue: _value, onChanged: (value){
                                            setState(() {
                                              _value = value!;
                                            });
                                          })
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: Dimensions.height30,),
                              InkWell(
                                onTap: (){
                                  if(validText(nameproduct.text) && validText(description.text) && validText(price.text) && validText(imageUrl!)){

                                    CustomProduct customProduct = CustomProduct(restoId: RestaurantUid.restaurantUid,
                                        name: nameproduct.text, description: description.text,
                                        image: imageUrl, price: price.text, popular: (_value ==2), category: dropValue, nombreDeVente: 0);
                                    var mapProduct = customProduct.toMap(customProduct);
                                    FirebaseFirestore firestore =FirebaseFirestore.instance;
                                    firestore.collection("Produits")
                                    .add(mapProduct);
                                  }
                                },
                                child: AppButton(
                                  backgroung: AppColors().mainColor,
                                    width: Dimensions.widtht45*5,
                                    child: BigText(text: "Ajouter",color: Colors.white,)
                                ),
                              )

                            ],
                          ),
                      ),
                  ),
                  )
            ],
          ),
        ),
      ),
    );
  }
  bool validText(String string){
    if(string.isNotEmpty && string != ""){
      return true;
    }
    else{
      return false;
    }
  }

  /* uploadImage(){
    var uploadInput = FileUploadInputElement()..accept = "image/*";
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final file = uploadInput.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event)async {
        final datetime = DateTime.now().toString();
        final userId = RestaurantUid.restaurantUid;
        final path = "$userId/$datetime";
       // final fil = File(fileBits, fileName)
        if(file!=null){
          Reference reference = FirebaseStorage.instance.ref();
          var upload =  reference.child("ProductImages").child(path).putFile();
          await upload.whenComplete(() async{
            var Url = await upload.snapshot.ref.getDownloadURL();
            setState(() {
              imageUrl = Url;
            });
            print("url : $Url");
          });
        }
      });
    });

  }*/*/

 /*void uploadToStorage()async{
  final _picker = ImagePicker();


  if(!kIsWeb){
    final XFile? image = await  _picker.pickImage(source: ImageSource.gallery,maxWidth: 500,maxHeight: 500);
    if(image!=null){
      var selected = File(image.path);
      setState(() {
        _pickedImage = selected;
      });
    }else{
      Get.snackbar("", "Aucune image n'est sélectionnée ");
    }
  }else if(kIsWeb){
    final XFile? image = await  _picker.pickImage(source: ImageSource.gallery,maxWidth: 500,maxHeight: 500);
    if(image!=null){
      var f = await image.readAsBytes();
      //final file = File.fromRawPath(f,);
      setState(() {
        webImage = f;
        _pickedImage = File("a");
      });
      String filename = DateTime.now().microsecondsSinceEpoch.toString();
      firebase_storage.Reference reference = firebase_storage.FirebaseStorage.instance.ref();
      final metadata = firebase_storage.SettableMetadata(contentType: "image/jpg");
      var upload =  reference.child("ProductImages").child(filename).putData(f,metadata);
      await upload.whenComplete(() async{
        imageUrl = await upload.snapshot.ref.getDownloadURL();
        print("url : $imageUrl");
        return imageUrl ;
      });

    }
    }else{
      Get.snackbar("", "Aucune image n'est sélectionnée ");
    }
  }*/
uploadImage()async{
  setState(() {
    uploading = true;
  });
FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles(type: FileType.image,);
  if(filePickerResult!=null){
    setState(() {
      webImage = filePickerResult.files.first.bytes!;
      _pickedImage = File("a");
    });
    String filename = DateTime.now().microsecondsSinceEpoch.toString();
    firebase_storage.Reference reference = firebase_storage.FirebaseStorage.instance.ref();
    final metadata = firebase_storage.SettableMetadata(contentType: "image/jpg");
    var upload =  reference.child("ProductImages").child(filename).putData(webImage!,metadata);
    await upload.whenComplete(() async{
      imageUrl = await upload.snapshot.ref.getDownloadURL();
      if(imageUrl!=null){
        setState(() {
          uploading = false;
        });
      }
      print("url : $imageUrl");
      return imageUrl ;
    });
  }

}
 }






 /* pickImage()async{
   html.File? file = await ImagePickerWeb.getImageAsFile();
    if(file!=null){
      setState(() {
        _imageFile = file;
      });
     String filename = DateTime.now().microsecondsSinceEpoch.toString()+file.toString();
      Reference reference = FirebaseStorage.instance.ref();
      print("filename : $filename");
      var upload =  reference.child("ProductImages").child(filename).putFile(file!);
      await upload.whenComplete(() async{
        imageUrl = await upload.snapshot.ref.getDownloadURL();
        print("url : $imageUrl");
        return imageUrl ;
      });/*.onError((error, stackTrace){
        Get.defaultDialog(title: "Stockage Error",
        content: BigText(text: error.toString()),
          contentPadding: EdgeInsets.all(Dimensions.widtht10),
        );
      });*/
    }
    
  }*/

