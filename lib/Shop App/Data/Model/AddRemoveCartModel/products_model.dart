import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/HomeModel/productsModel.dart';

import '../../../Domain/Entity/CartField/AddRemoveFromCart/product.dart';

class ProductAddRemoveCartModel extends ProductAddRemoveCart{
  ProductAddRemoveCartModel({required super.id, required super.price, required super.oldPrice, required super.discount, required super.image, required super.name, required super.description});
  factory ProductAddRemoveCartModel.fromJason(Map<String,dynamic> json){
    return ProductAddRemoveCartModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description']);
  }
}