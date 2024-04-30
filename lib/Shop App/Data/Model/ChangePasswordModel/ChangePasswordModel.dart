import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/DataModel/DataModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/ChangePasswordEntity/ChangePasswordEntity.dart';

class ChangePasswordModel extends ChangePasswordEntity{
  ChangePasswordModel({required super.status, required super.message, required super.dataEntity});
  factory ChangePasswordModel.fromJason(Map<String,dynamic> json){
    print('model1 at change');
    return ChangePasswordModel(
        status: json['status'],
        message: json['message'],
        dataEntity: DataModel.fromJason(json['data']),
    );
  }
}