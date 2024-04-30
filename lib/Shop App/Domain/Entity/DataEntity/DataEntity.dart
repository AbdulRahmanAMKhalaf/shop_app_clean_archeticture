import 'package:equatable/equatable.dart';

import '../../../Data/Model/DataModel/DataModel.dart';

class DataEntity extends Equatable {
  String ?name;
  String ?email;
  String ?phone;
  String ?token;
  int ?id;

  DataEntity(
      {required this.name,
      required this.email,
      required this.phone,
      required this.token,
      required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [this.email, this.phone, this.name, this.token,this.id];
}
