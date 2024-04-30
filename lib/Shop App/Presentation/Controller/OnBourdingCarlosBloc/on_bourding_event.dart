part of 'on_bourding_bloc.dart';

@immutable
abstract  class OnBourdingEvent {}
class OnBoardingOneControllerInitial extends OnBourdingEvent {

}

class OnBoardingOneControllerDispose extends OnBourdingEvent {

}

class OnBoardingOneNextPage extends OnBourdingEvent {
  final int index;

   OnBoardingOneNextPage(this.index);


}
