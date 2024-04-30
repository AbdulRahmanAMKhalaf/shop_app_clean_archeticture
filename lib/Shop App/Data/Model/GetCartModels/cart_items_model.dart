import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/GetCartModels/products_get_Cart_model.dart';

import '../../../Domain/Entity/CartField/GetCart/cart_items_list.dart';

class CartItemsModels extends CartItemsList{
  CartItemsModels({required super.id, required super.quantity, required super.productGetCart});
  factory CartItemsModels.fromJason(Map<String,dynamic> json){
    return CartItemsModels(
        id: json['id'],
        quantity: json['quantity'],
        productGetCart: ProductsGetCartModel.fromJason(json['product']));
  }
}