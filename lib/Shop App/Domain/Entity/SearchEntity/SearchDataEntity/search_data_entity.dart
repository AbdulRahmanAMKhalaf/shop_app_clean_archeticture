import 'package:equatable/equatable.dart';

import '../../../../Data/Model/SearchModel/data_list_model.dart';

class SearchDataEntity extends Equatable {
  List<DataListModel> data=[];


  SearchDataEntity({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

