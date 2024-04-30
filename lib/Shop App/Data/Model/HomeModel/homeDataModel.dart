import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/HomeModel/bannersModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/HomeModel/productsModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/HomeField/homeDataEntity.dart';

class HomeDataModel extends HomeDataEntity {
  HomeDataModel({required super.bannersList, required super.productsList});
  factory HomeDataModel.fromJason(Map<String, dynamic> json) {
    return HomeDataModel(
      bannersList: List.from(
          (json['banners'] as List).map((e) => BannersModel.fromJason(e))),
      productsList: List.from(
          (json['products'] as List).map((e) => ProductsModel.fromJason(e))),
    );
  }
}
