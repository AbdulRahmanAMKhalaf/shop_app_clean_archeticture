part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}
final class GetRegisterDataSuccessfullyState extends RegisterState{}
final class GetRegisterDataErrorState extends RegisterState{}
final class GetRegisterDataLoadingState extends RegisterState{}
final class ChangeIconState extends RegisterState{}
