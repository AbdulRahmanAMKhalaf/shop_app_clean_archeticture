import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/DataModel/DataModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/RegisterField/RegisterEntity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel(
      {required super.status,
      required super.message,
      required super.dataEntity});
  factory RegisterModel.fromJason(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['message'],
      dataEntity: DataModel.fromJason(json['data']),
    );
  }
}
