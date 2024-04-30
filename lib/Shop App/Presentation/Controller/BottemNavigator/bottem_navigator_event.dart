part of 'bottem_navigator_bloc.dart';


abstract class BottemNavigatorEvent {}
class GetChangeBottemIcon extends BottemNavigatorEvent{
  int tapIndex;

  GetChangeBottemIcon({required this.tapIndex});
}