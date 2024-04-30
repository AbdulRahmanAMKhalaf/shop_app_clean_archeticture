import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/AddRemoveFromCart/product.dart';

class DataAddRemoveCart extends Equatable{
  int quantity;
  ProductAddRemoveCart products;

  DataAddRemoveCart({required this.quantity,required this.products});

  @override
  // TODO: implement props
  List<Object?> get props => [quantity,products];
}