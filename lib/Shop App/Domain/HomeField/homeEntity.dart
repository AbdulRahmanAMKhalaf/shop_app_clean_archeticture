import 'package:equatable/equatable.dart';

import 'homeDataEntity.dart';

class HomeEntity extends Equatable{
  bool status;
  String ?message;
  HomeDataEntity homeDataEntity;

  HomeEntity({required this.status,required this.message,required this.homeDataEntity});

  @override
  // TODO: implement props
  List<Object?> get props =>[this.homeDataEntity,this.message,this.status];
}