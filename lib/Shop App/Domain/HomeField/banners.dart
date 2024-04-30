import 'package:equatable/equatable.dart';

class Banners extends Equatable{
  int id;
  String ?image;

  Banners({required this.id,required this.image});

  @override
  // TODO: implement props
  List<Object?> get props =>[this.image,this.id];
}