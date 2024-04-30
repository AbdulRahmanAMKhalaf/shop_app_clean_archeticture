import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/DataModel/DataModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/LogoutField/LogoutField.dart';

class LogoutModel extends LogoutEntity{
  LogoutModel({required super.status, required super.message, required super.dataEntity});
  factory LogoutModel.fromJason(Map<String,dynamic> json){
    return LogoutModel(
        status: json['status'],
        message: json['message'],
        dataEntity:DataModel.fromJason(json['data']),
    );
  }
}