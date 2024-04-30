part of 'profile_bloc.dart';


abstract class ProfileEvent {}
class GetProfileDataEvent extends ProfileEvent{
  String authorized;

  GetProfileDataEvent({required this.authorized});
}
class GetChangePasswordEvent extends ProfileEvent{
  String currentPassword;
  String newPassword;

  GetChangePasswordEvent({required this.currentPassword,required this.newPassword});
}
class GetLogoutEvent extends ProfileEvent{
  String authorized;

  GetLogoutEvent(this.authorized);
}