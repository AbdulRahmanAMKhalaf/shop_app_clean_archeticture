import 'package:shop_app_clean_archeticture/Shop%20App/Domain/HomeField/banners.dart';

class BannersModel extends Banners{
  BannersModel({required super.id, required super.image});
  factory BannersModel.fromJason(Map<String,dynamic> json){

    return BannersModel(
        id: json['id'],
        image: json['image']);
  }
}