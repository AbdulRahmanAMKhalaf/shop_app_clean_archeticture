import 'package:equatable/equatable.dart';

import 'data.dart';

class AddRemoveFromCartEntity extends Equatable {
  bool status;
  String ?message;
  DataAddRemoveCart data;

  AddRemoveFromCartEntity(
      {required this.status, required this.message, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}
