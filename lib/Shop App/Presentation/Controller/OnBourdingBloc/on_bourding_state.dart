part of 'on_bourding_bloc.dart';


abstract class OnBourdingState {}

class InitialOnBourdingState extends OnBourdingState {}
class OnBourdingDataLoading extends OnBourdingState{}
class OnBourdingDataSuccessfully extends OnBourdingState{}
class OnBourdingDataError extends OnBourdingState{}

