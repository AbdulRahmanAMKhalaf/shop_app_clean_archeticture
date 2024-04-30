import 'package:shop_app_clean_archeticture/Shop%20App/Domain/HomeField/products.dart';

class ProductsModel extends Products{
  ProductsModel({required super.id, required super.price, required super.oldPrice, required super.discount, required super.image, required super.name, required super.description});
  factory ProductsModel.fromJason(Map<String,dynamic> json){
    return ProductsModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description']);
  }
}