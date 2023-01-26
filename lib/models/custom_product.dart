
class CustomProduct{
  String? restoId,image,description,name,price,category;
  bool? popular;
  int? nombreDeVente;
  CustomProduct({
    required this.restoId,
    required this.name,
    required this.description ,
    required this.image,
    required this.price,
    required this.popular,
    required this.category,
    required this.nombreDeVente
  });


  toMap(CustomProduct customProduct){
    return {
      "resto":customProduct.restoId,
      "name":customProduct.name,
      "description":customProduct.description,
      "price":customProduct.price,
      "image":customProduct.image,
      "popular":customProduct.popular,
      "category":customProduct.category,
      "nombreDeVente":customProduct.nombreDeVente
    };
  }
}