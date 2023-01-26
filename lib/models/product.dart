import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
   String? id,restoId,image,description,name,price,category;
   bool? popular;
  int? nombreDeVente;
  Product({
    required this.id,
    required this.restoId,
    required this.name,
    required this.description ,
    required this.image,
    required this.price,
    required this.popular,
    required this.category,
    required this.nombreDeVente
  });

  Product.fromDocumentSnapshot({ required DocumentSnapshot documentSnapshot}){

    id = documentSnapshot.id;
    description = documentSnapshot["description"];
    name = documentSnapshot["name"];
    price =documentSnapshot["price"];
    image = documentSnapshot["image"];
    popular = documentSnapshot["popular"];
    category = documentSnapshot["category"];
    nombreDeVente = documentSnapshot['nombreDeVente'];
    restoId = documentSnapshot['restoId'];
  }

  toMap(Product product){
    return {
      "id" : product.id,
      "resto":product.restoId,
      "name":product.name,
      "description":product.description,
      "price":product.price,
      "image":product.image,
      "popular":product.popular,
      "category":product.category,
      "nombreDeVente":product.nombreDeVente
    };
  }

}