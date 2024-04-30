part of 'register_bloc.dart';

abstract class RegisterEvent {}

class GetRegisterEvent extends RegisterEvent {
  String name;
  String phone;
  String email;
  String? image;
  String password;

  GetRegisterEvent(
      {required this.name,
      required this.phone,
      required this.email,
      this.image='https://th.bing.com/th/id/OIP.1yoSL-WO0YU5mQKROudvswHaHa?w=194&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      required this.password});
}
class GetChangeSecureIconEvent extends RegisterEvent{}
