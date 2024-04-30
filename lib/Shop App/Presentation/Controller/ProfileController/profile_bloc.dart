import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Constant/Constant.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/ProfileField/ProfileField.dart';
import '../../../Core/ShardPrefrences/SharedPrefrences.dart';
import '../../../Domain/UseCase/ChangePasswordUseCase/GetChangePasswodUseCase.dart';
import '../../../Domain/UseCase/LogoutUseCase/GetLogoutUseCase.dart';
import '../../../Domain/UseCase/ProfileUseCase/GetProfileDataUseCase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  GetProfileDataUseCase getProfileDataUseCase;
  GetChangePasswordUseCase getChangePasswordUseCase;
  GetLogoutUseCase getLogoutUseCase;

  ProfileBloc(this.getProfileDataUseCase,this.getChangePasswordUseCase,this.getLogoutUseCase) : super(ProfileInitialState()) {
    on<GetProfileDataEvent>(getProfileData);
    on<GetChangePasswordEvent>(getChangePassword);
    on<GetLogoutEvent>(getLogoutData);

  }


  /// Get Profile Data
  FutureOr<void> getProfileData(GetProfileDataEvent event, Emitter<ProfileState> emit) async{
    emit(GetProfileDataLoadingState());
    final result=await getProfileDataUseCase(Parameters(autharization: event.authorized));
    result.fold(
            (left){
              Fluttertoast.showToast(
                  msg: left.errorMessage,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              emit(GetProfileDataErrorState());
            },
            (right){
              if(right.status==true){
                Fluttertoast.showToast(
                    msg:'successfully Proccess',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
                GetProfileDataSuccessfullyState.profileEntity=right;
                emit(GetProfileDataSuccessfullyState());
              }
              else{
                Fluttertoast.showToast(
                    msg: 'Unsuccessfully Proccess',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                emit(GetProfileDataErrorState());
              }
            }
    );
  }

  /// Change Password
  FutureOr<void> getChangePassword(GetChangePasswordEvent event, Emitter<ProfileState> emit) async{
    final result= await getChangePasswordUseCase(Parameters(autharization: Constant.token!,password: event.currentPassword,newPassword: event.newPassword));
    result.fold(
            (left) {
          emit(ChangePasswordErrorState());
          Fluttertoast.showToast(
              msg: left.errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          emit(ChangePasswordSuccessfullyState());
        },
            (right){
          emit(ChangePasswordLoadingState());
          if(right.status==true){
            Fluttertoast.showToast(
                msg: right.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          else{
            Fluttertoast.showToast(
                msg: right.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          emit(ChangePasswordSuccessfullyState());
        }
    );
  }

  /// Logout Data
  FutureOr<void> getLogoutData(GetLogoutEvent event, Emitter<ProfileState> emit) async{
    final result=await getLogoutUseCase(Parameters(autharization: event.authorized));
    result.fold(
            (left){
          emit(LogoutLoadingState());
          Fluttertoast.showToast(
              msg:left.errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          emit(LogoutSuccessfullyState());
        },
            (right) {
          emit(LogoutLoadingState());
          if(right.status==true){
            Constant.token ='';
            SharedPrefrences.setData(key: 'savedToken', value: null)
                .then((value) {
              Fluttertoast.showToast(
                  msg: right.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              print(Constant.token);
            }).catchError((onError) {
              print('$onError At Flutter Toast');
            });
          }
          else{
            Fluttertoast.showToast(
                msg: right.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          emit(LogoutSuccessfullyState());
        }
    );
  }

}
