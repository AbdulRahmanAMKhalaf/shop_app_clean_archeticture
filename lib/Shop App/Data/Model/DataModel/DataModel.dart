import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/DataEntity/DataEntity.dart';

class DataModel extends DataEntity {
  DataModel(
      {required super.name,
      required super.email,
      required super.phone,
      required super.token,
      required super.id});
  factory DataModel.fromJason(Map<String, dynamic> ?json) {
    print('model number 2');
    return DataModel(
      name: json?['name'],
      email: json?['email'],
      phone: json?['phone'],
      token: json?['token'],
      id: json?['id'],
    );
  }
}
