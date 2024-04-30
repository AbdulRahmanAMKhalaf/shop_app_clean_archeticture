import 'package:equatable/equatable.dart';

import '../DataEntity/DataEntity.dart';

class ProfileEntity extends Equatable{
  bool ?status;
  String ?message;
  DataEntity ?dataLoginEntity;

  ProfileEntity(
      {required this.status,
        required this.message,
        required this.dataLoginEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [message, status, dataLoginEntity];
}