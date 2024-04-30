import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/SearchEntity/SearchDataEntity/data_list.dart';

class DataListModel extends DataList{
  DataListModel({required super.id, required super.price, required super.oldPrice, required super.discount, required super.image, required super.name, required super.description});
  factory DataListModel.fromJason(Map<String,dynamic>json){
    return DataListModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description']);
  }
}