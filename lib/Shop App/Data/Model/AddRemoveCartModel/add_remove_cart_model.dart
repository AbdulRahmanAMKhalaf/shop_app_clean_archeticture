import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/AddRemoveCartModel/data_add_remove_cart_model.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/AddRemoveFromCart/add_remove_from_cart.dart';

class AddRemoveCartModel extends AddRemoveFromCartEntity{
  AddRemoveCartModel({required super.status, required super.message, required super.data});
  factory AddRemoveCartModel.fromJason(Map<String,dynamic> json){
    return AddRemoveCartModel(
        status: json['status'],
        message: json['message'],
        data: DataAddRemoveCartModel.fromJason(json['data']));
  }
}