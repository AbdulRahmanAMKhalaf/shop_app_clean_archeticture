import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/SearchModel/data_list_model.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/SearchEntity/SearchDataEntity/search_data_entity.dart';

class SearchDataModel extends SearchDataEntity {
  SearchDataModel({required super.data});
  factory SearchDataModel.fromJason(Map<String, dynamic> json) {
    return SearchDataModel(
        data: List.from(
            (json['data'] as List).map((e) => DataListModel.fromJason(e))));
  }
}
