part of 'on_bourding_bloc.dart';

@immutable
sealed class OnBourdingState {}

class OnBoardingOneInitial extends OnBourdingState {}

class OnBoardingOneControllerInitialSuccessState extends OnBourdingState {}

class OnBoardingOneControllerInitialFailState extends OnBourdingState {}

class OnBoardingOneControllerDisposeState extends OnBourdingState {}

class OnBoardingOneReachLastPage extends OnBourdingState {}

class OnBoardingOneNotLastPage extends OnBourdingState {}
