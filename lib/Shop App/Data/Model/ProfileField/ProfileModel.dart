import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/DataModel/DataModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/ProfileField/ProfileField.dart';

class ProfileModel extends ProfileEntity{
  ProfileModel({
    required super.status,
    required super.message,
    required super.dataLoginEntity,
  });

  factory ProfileModel.fromJason(Map<String,dynamic> json){
    print('model number 1');
    return ProfileModel(
      status: json['status'],
      message: json['message'],
      dataLoginEntity:DataModel.fromJason(json['data']),
    );
  }
}