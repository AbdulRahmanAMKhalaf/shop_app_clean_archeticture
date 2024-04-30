import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import '../../../Core/ShardPrefrences/SharedPrefrences.dart';
import '../../../Core/Utils/Constant/Constant.dart';
import '../../../Domain/UseCase/RegisterUseCase/GetRegisterUseCase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  GetRegisterUseCase getRegisterUseCase;
  RegisterBloc(this.getRegisterUseCase) : super(RegisterInitialState()) {
    on<GetRegisterEvent>(getRegisterData);
    on<GetChangeSecureIconEvent>(changeSecureIcon);
  }
  static bool isSecure=true;

  /// Register Data
  FutureOr<void> getRegisterData(
      GetRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(GetRegisterDataLoadingState());
    final result = await getRegisterUseCase(Parameters(
        email: event.email,
        password: event.password,
        name: event.name,
        phone: event.phone));
    result.fold(
      (left) {
        Fluttertoast.showToast(
            msg: left.errorMessage,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(GetRegisterDataErrorState());
        print('${left}Left');
      },
      (right) {
        emit(GetRegisterDataLoadingState());
        SharedPrefrences.setData(key: 'savedToken', value: Constant.token)
            .then((value) {
          Constant.token = right.dataEntity.token!;
          Fluttertoast.showToast(
              msg: right.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }).catchError((onError) {
          print('$onError At Flutter Toast');
        });
        emit(GetRegisterDataSuccessfullyState());
        print('${right}right');
      },
    );
  }

  /// Secure Icon
  FutureOr<void> changeSecureIcon(GetChangeSecureIconEvent event, Emitter<RegisterState> emit) {
    isSecure=!isSecure;
    emit(ChangeIconState());
  }
}
