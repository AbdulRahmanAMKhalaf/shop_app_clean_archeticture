part of 'login_bloc.dart';


abstract class LoginState {}


class InitialLoginState extends LoginState{

}

class GetLoginDataSuccessfully extends LoginState{}

class GetLoginDataError extends LoginState{}

class GetLoginDataLoading extends LoginState{

}

class IsSecureState extends LoginState{


}

class ChangeIconState extends LoginState{}
