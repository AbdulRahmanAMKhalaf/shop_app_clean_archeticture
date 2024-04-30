import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/DataEntity/DataEntity.dart';

class RegisterEntity extends Equatable {
  bool status;
  String message;
  DataEntity dataEntity;

  RegisterEntity(
      {required this.status, required this.message, required this.dataEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [this.dataEntity, this.message, this.status];
}
