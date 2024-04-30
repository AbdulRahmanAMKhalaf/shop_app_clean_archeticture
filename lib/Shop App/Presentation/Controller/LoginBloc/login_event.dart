part of 'login_bloc.dart';


abstract class LoginEvent {}
class GetLoginDataEvent extends LoginEvent{
  String emailAddress;
  String password;

  GetLoginDataEvent({required this.emailAddress,required this.password});
}
class GetChangeSecureIconEvent extends LoginEvent{}