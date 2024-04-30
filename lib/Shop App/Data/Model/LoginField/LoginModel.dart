import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/DataModel/DataModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/LoginField/LoginEntity.dart';

class LoginModel extends LoginEntity{
  LoginModel({
    required super.status,
    required super.message,
    required super.dataLoginEntity,
    });

  factory LoginModel.fromJason(Map<String,dynamic> json){
    return LoginModel(
        status: json['status'],
        message: json['message'],
        dataLoginEntity:DataModel.fromJason(json['data']),
    );
  }

}