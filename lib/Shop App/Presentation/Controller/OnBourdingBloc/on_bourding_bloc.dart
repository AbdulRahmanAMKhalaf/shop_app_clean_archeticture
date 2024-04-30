import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/ShardPrefrences/SharedPrefrences.dart';
import '../../../Core/Utils/Constant/Constant.dart';
import '../../../Domain/Entity/BourdingField/BourdingEntity.dart';

part 'on_bourding_event.dart';
part 'on_bourding_state.dart';

class OnBourdingBloc extends Bloc<OnBourdingEvent, OnBourdingState> {
  OnBourdingBloc() : super(InitialOnBourdingState()) {
    on<GetOnBourdingDataEvent>(getBourdingDataEvent);
  }

  List<BourdingEntity> bourdingData = [
    BourdingEntity(
        Image:
            'https://th.bing.com/th/id/OIP.ajV4GS8ypLZRJE8D6dY6mQHaE4?w=280&h=185&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        headTitle: 'Big Sale',
        overView: 'The best place for best price ,discout at 80%'),
    BourdingEntity(
        Image:
            'https://th.bing.com/th/id/OIP.QG-nnlNOCLZBig36kBgjQQAAAA?w=254&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
        headTitle: 'High Security',
        overView: 'high level of security at payment operation'),
    BourdingEntity(
        Image:
            'https://th.bing.com/th/id/R.8a8239e8250b58e0e4caaef75dc69756?rik=XCklr7jO8Sf3Ag&pid=ImgRaw&r=0',
        headTitle: 'One place for all thing ',
        overView: 'every thing is here with all your specification aspect'),
  ];


  PageController pageController=PageController();

  static OnBourdingBloc bloc(context)=>BlocProvider.of(context);

  static int pageNumder=0;

  FutureOr<void> getBourdingDataEvent(
      GetOnBourdingDataEvent event, Emitter<OnBourdingState> emit) {
    emit(OnBourdingDataLoading());
    var result;
    if (bourdingData == null)
      emit(OnBourdingDataError());
    else {
      SharedPrefrences.setData(key: 'savedBourding', value: true).then((value){
        print('token = ${Constant.token}');
        result = bourdingData;
        return result;
      });
      emit(OnBourdingDataSuccessfully());
    }
  }
}
