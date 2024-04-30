import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import '../../../Domain/Entity/BourdingField/BourdingEntity.dart';
import '../Faliure/Faliure.dart';

abstract class RemoteBaseUseCase<T, Data> {
  Future<Either<Faliure, T>> call(Data data);
}

abstract class LocalBaseUseCase<T, Data> {
  Either<Faliure, T> call(Data data);
}

class Parameters extends Equatable {
  String email;
  String password;
  List<BourdingEntity> bourdingData = [];
  String name;
  String phone;
  String autharization;
  String newPassword;
  int id;

  Parameters(
      {this.email = '',
      this.password = '',
      this.bourdingData = const [],
      this.phone = '',
      this.name = '',
      this.autharization = '',
      this.newPassword = '',
      this.id = 0});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [email, password, bourdingData, name, phone, autharization, id];
}

class NoParameters extends Equatable {
  NoParameters();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
