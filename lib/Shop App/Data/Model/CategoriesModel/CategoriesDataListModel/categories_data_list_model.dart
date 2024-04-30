import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CategoriesField/CategoriesDataList/categories_data_list.dart';

class CategoriesDataListModel extends CategoriesDataList{
  CategoriesDataListModel({required super.id, required super.name, required super.image});
  factory CategoriesDataListModel.fromJason(Map<String,dynamic> json){
    return CategoriesDataListModel(
        id: json['id'],
        name: json['name'],
        image: json['image']);
  }
}