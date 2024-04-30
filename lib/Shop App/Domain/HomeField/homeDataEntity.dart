import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/HomeField/products.dart';
import 'banners.dart';

class HomeDataEntity extends Equatable {
  List<Banners> bannersList;
  List<Products> productsList;

  HomeDataEntity({required this.bannersList, required this.productsList});

  @override
  // TODO: implement props
  List<Object?> get props => [this.bannersList,this.productsList];
}
