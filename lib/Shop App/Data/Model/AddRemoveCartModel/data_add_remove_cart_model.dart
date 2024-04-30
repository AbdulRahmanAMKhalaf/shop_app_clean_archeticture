import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/AddRemoveCartModel/products_model.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/AddRemoveFromCart/data.dart';

class DataAddRemoveCartModel extends DataAddRemoveCart{
  DataAddRemoveCartModel({required super.quantity, required super.products});
  factory DataAddRemoveCartModel.fromJason(Map<String,dynamic> json){
    return DataAddRemoveCartModel(
        quantity: json['quantity'],
        products: ProductAddRemoveCartModel.fromJason(json['product']));
  }
}