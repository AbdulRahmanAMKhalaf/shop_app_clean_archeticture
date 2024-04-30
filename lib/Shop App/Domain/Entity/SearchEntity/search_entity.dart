import 'package:equatable/equatable.dart';

import 'SearchDataEntity/search_data_entity.dart';

class SearchEntity extends Equatable {
  bool status;
  SearchDataEntity searchDataEntity;

  SearchEntity({required this.status, required this.searchDataEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [searchDataEntity, status];
}
