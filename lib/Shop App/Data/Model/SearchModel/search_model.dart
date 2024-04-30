import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/SearchModel/SearchDataModel/search_data_model.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/SearchEntity/search_entity.dart';

class SearchModel extends SearchEntity {
  SearchModel({required super.status, required super.searchDataEntity});
  factory SearchModel.fromJason(Map<String, dynamic> json) {
    return SearchModel(
      status: json['status'],
      searchDataEntity: SearchDataModel.fromJason(json['data']),
    );
  }
}
