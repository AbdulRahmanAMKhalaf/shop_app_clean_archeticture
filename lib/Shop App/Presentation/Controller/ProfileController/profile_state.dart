part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}
class GetProfileDataLoadingState extends ProfileState{}
class GetProfileDataSuccessfullyState extends ProfileState{
  static ProfileEntity ?profileEntity;
}
class GetProfileDataErrorState extends ProfileState{}
class ChangePasswordInitialState extends ProfileState {}
class ChangePasswordLoadingState extends ProfileState{}
class ChangePasswordSuccessfullyState extends ProfileState{}
class ChangePasswordErrorState extends ProfileState{}
class LogoutLoadingState extends ProfileState{}
class LogoutSuccessfullyState extends ProfileState{}
class LogoutErrorState extends ProfileState{}