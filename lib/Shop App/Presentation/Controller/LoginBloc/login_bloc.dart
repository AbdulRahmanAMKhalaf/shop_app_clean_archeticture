import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import '../../../Core/ShardPrefrences/SharedPrefrences.dart';
import '../../../Core/Utils/Constant/Constant.dart';
import '../../../Domain/UseCase/LoginUseCase/Get LoginUseCase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  GetLoginUseCase getLoginUseCase;
  LoginBloc(this.getLoginUseCase) : super(InitialLoginState()) {
    on<GetLoginDataEvent>(getLoginData);
    on<GetChangeSecureIconEvent>(changeSecureIcon);
  }
  /// Login Data
  FutureOr<void> getLoginData(
      GetLoginDataEvent event, Emitter<LoginState> emit) async {
    emit(GetLoginDataLoading());

    final result = await getLoginUseCase(
        Parameters(password: event.password, email: event.emailAddress));
    result.fold((left) {
      Fluttertoast.showToast(
          msg: left.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(GetLoginDataError());
    }, (right) {
     if(right.status==true) {
        SharedPrefrences.setData(key: 'savedToken', value: right.dataLoginEntity.token)
            .then((value) {
          Constant.token = right.dataLoginEntity.token!;
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
        emit(GetLoginDataSuccessfully());
      }else{
       Fluttertoast.showToast(
           msg: right.message,
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0);
       emit(GetLoginDataError());
     }
    });
  }

  /// Secure Icon
  static bool isSecure = true;
  FutureOr<void> changeSecureIcon(GetChangeSecureIconEvent event, Emitter<LoginState> emit) {
    isSecure=!isSecure;
    emit(ChangeIconState());
  }
}
