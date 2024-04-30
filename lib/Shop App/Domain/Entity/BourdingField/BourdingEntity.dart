import 'package:equatable/equatable.dart';

class BourdingEntity extends Equatable{
  String Image;
  String headTitle;
  String overView;

  BourdingEntity({required this.Image,required this.headTitle,required this.overView});

  @override
  // TODO: implement props
  List<Object?> get props =>[this.overView,this.headTitle,this.Image];

}