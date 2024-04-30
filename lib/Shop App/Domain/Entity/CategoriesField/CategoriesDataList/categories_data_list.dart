import 'package:equatable/equatable.dart';

class CategoriesDataList extends Equatable{
  int id;
  String name;
  String image;

  CategoriesDataList({required this.id,required this.name,required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [image,name,id];
}