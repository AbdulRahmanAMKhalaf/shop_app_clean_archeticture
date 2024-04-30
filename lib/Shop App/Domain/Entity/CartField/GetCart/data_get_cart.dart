import 'package:equatable/equatable.dart';

import 'cart_items_list.dart';

class DataGetCart extends Equatable{
  List<CartItemsList>cartItems=[];
  dynamic total;
  dynamic subTotal;

  DataGetCart({required this.cartItems,required this.subTotal,required this.total});

  @override
  // TODO: implement props
  List<Object?> get props => [
    cartItems,
  ];

}