import 'package:equatable/equatable.dart';

 class ErrorModel extends Equatable{
  bool ?status;
  String ?message;

  ErrorModel({required this.status,required this.message});
  factory ErrorModel.fromJason(Map<String,dynamic> json){
    return ErrorModel(
      message: json['message'],
      status: json['status']
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [this.message,this.status];

}