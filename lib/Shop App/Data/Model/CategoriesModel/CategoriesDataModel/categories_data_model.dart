import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/CategoriesModel/CategoriesDataListModel/categories_data_list_model.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CategoriesField/CategoriesData/categories_data.dart';

class CategoriesDataModel extends CategoriesData{
  CategoriesDataModel({required super.dataList});
  factory CategoriesDataModel.fromJason(Map<String,dynamic> json){
    return CategoriesDataModel(
        dataList:List.from((json['data'] as List).map((e) =>CategoriesDataListModel.fromJason(e) )),
    );
  }
}