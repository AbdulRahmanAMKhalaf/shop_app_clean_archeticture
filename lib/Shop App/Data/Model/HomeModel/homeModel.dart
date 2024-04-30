import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/HomeModel/homeDataModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/HomeField/homeEntity.dart';

class HomeModel extends HomeEntity {
  HomeModel(
      {required super.status,
      required super.message,
      required super.homeDataEntity});
  factory HomeModel.fromJason(Map<String, dynamic> json) {
    return HomeModel(
        status: json['status'],
        message: json['image'],
        homeDataEntity: HomeDataModel.fromJason(json['data']));
  }
}
