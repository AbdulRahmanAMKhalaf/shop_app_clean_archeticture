import 'package:equatable/equatable.dart';

import 'CategoriesData/categories_data.dart';

class CategoriesEntity extends Equatable{
  bool states;
  CategoriesData data;

  CategoriesEntity({required this.states,required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data,states];
}