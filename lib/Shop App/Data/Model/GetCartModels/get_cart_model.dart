
import '../../../Domain/Entity/CartField/GetCart/get_cart.dart';
import 'data_get_cart_model.dart';

class GetCartModel extends GetCartEntity{
  GetCartModel({required super.status, required super.data});
  factory GetCartModel.fromJason(Map<String,dynamic> json){
    return GetCartModel(
        status: json['status'],
        data: DatGetCartModel.fromJason(json['data']));
  }
}