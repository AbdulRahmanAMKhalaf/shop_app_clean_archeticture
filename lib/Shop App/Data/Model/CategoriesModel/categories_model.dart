import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/CategoriesModel/CategoriesDataModel/categories_data_model.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CategoriesField/categories_entity.dart';

class CategoriesModel extends CategoriesEntity{
  CategoriesModel({required super.states, required super.data});
  factory CategoriesModel.fromJason(Map<String,dynamic> json){
    return CategoriesModel(
        states: json['status'],
        data: CategoriesDataModel.fromJason(json['data']));
  }
}