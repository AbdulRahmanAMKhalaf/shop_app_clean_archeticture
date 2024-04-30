import 'package:equatable/equatable.dart';

import '../DataEntity/DataEntity.dart';

class LoginEntity extends Equatable {
  bool status;
  String message;
  DataEntity dataLoginEntity;

  LoginEntity(
      {required this.status,
      required this.message,
      required this.dataLoginEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [message, status, dataLoginEntity];
}
