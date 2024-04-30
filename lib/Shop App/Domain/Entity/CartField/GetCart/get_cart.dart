import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/GetCart/data_get_cart.dart';

class GetCartEntity extends Equatable{
  bool status;
  DataGetCart data;

  GetCartEntity({required this.status,required this.data});

  @override
  // TODO: implement props
  List<Object?> get props =>[
    status,
    data,
  ];

}