import 'package:equatable/equatable.dart';
import '../CategoriesDataList/categories_data_list.dart';

class CategoriesData extends Equatable{

 List<CategoriesDataList>dataList=[];


 CategoriesData({required this.dataList});

  @override
  // TODO: implement props
  List<Object?> get props => [dataList];

}