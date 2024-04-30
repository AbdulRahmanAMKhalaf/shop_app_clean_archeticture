import '../../../Domain/Entity/CartField/GetCart/data_get_cart.dart';
import 'cart_items_model.dart';

class DatGetCartModel extends DataGetCart {
  DatGetCartModel({required super.cartItems,required super.subTotal,required super.total});
  factory DatGetCartModel.fromJason(Map<String, dynamic> json) {
    return DatGetCartModel(
      cartItems: List.from((json['cart_items'] as List)
          .map((e) => CartItemsModels.fromJason(e))),
      subTotal:json['sub_total'],
      total: json['total']
    );
  }
}
