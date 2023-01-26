import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
class Restaurant{
  String? id, name,email,description,telephone, adresse;
  late List<String?> restaurantImages ;
  int? nombreVente;

  Restaurant({
    required this.id,
    required this.name,
    required this.email,
    required this.description,
    required this.adresse,
    required this.telephone,
    required this.restaurantImages,
    required this.nombreVente
  });

  toMap(Restaurant restaurant){
    return {
      "id":restaurant.id,
      "name":restaurant.name,
      "description":restaurant.description,
      "email":restaurant.email,
      "adresse":restaurant.adresse,
      "telephone":restaurant.telephone,
      "restaurantsImages":restaurant.restaurantImages,
      "nombreVente":restaurant.nombreVente
    };
  }

  Restaurant.fromDocumentSnapshot({ required DocumentSnapshot snapshot}){
    id = snapshot.id;
    name = snapshot["name"];
    description = snapshot["description"];
    email = snapshot["email"];
    adresse = snapshot["adresse"];
    telephone = snapshot["telephone"];
    restaurantImages = snapshot["restaurantImages"];
    nombreVente = snapshot["nombreVente"];

  }

}