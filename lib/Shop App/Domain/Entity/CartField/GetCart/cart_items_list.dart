import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/GetCart/products_get_cart.dart';

class CartItemsList extends Equatable {
  int id;
  int quantity;
  ProductGetCart productGetCart;

  CartItemsList(
      {required this.id, required this.quantity, required this.productGetCart});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        quantity,
        productGetCart,
      ];
}
