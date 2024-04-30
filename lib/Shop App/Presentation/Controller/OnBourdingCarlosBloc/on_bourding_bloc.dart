import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../Domain/Entity/BourdingField/BourdingEntity.dart';

part 'on_bourding_event.dart';
part 'on_bourding_state.dart';

class OnBourdingBloc extends Bloc<OnBourdingEvent, OnBourdingState> {
  
  OnBourdingBloc() : super(OnBoardingOneInitial()) {
    on<OnBoardingOneControllerInitial>(_onBoardingOneControllerInitial);
    on<OnBoardingOneControllerDispose>(_onBoardingOneControllerDispose);
    on<OnBoardingOneNextPage>(_onBoardingOneNextPage);
  }
  PageController? pageController;
  List<BourdingEntity> onBoardingOneModel = [
    BourdingEntity(
      Image:
      "https://images.unsplash.com/photo-1507133750040-4a8f57021571?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80",
      headTitle: "Home Of Coffee",
      overView:
      "Welcome to our cozy coffee house, where every sip is a moment of warmth and relaxation.",
    ),
    BourdingEntity(
      Image:
      "https://images.unsplash.com/photo-1543233604-3baca4d35513?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      headTitle: "Home Of Coffee",
      overView:
      "Welcome to our cozy coffee house, where every sip is a moment of warmth and relaxation.",
    ),
    BourdingEntity(
      Image:
      "https://images.unsplash.com/photo-1564520599940-c06900b727f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
      headTitle: "Home Of Coffee",
      overView:
      "Welcome to our cozy coffee house, where every sip is a moment of warmth and relaxation.",
    ),
  ];
  void _onBoardingOneControllerInitial(
      OnBoardingOneControllerInitial event,
      Emitter emit,
      ) async {
    try {
      pageController = PageController();
      emit(OnBoardingOneControllerInitialSuccessState());
    } catch (e) {
      debugPrint(
          "Error in _onBoardingOneControllerInitial :::: ${e.toString()}");
      emit(OnBoardingOneControllerInitialFailState());
    }
  }

  ///------------------ [OnBoardingOneControllerDispose] ------------------\\\
  void _onBoardingOneControllerDispose(
      OnBoardingOneControllerDispose event,
      Emitter emit,
      ) async {
    try {
      pageController!.dispose();
    } catch (e) {
      print(
          '####### The Error is in _onBoardingOneControllerDispose ${e.toString()}');
    }
  }

  ///------------------ [OnBoardingOneNextPage] ------------------\\\
  void _onBoardingOneNextPage(OnBoardingOneNextPage event, Emitter emit) async {
    if (event.index == onBoardingOneModel.length - 1) {
      emit(OnBoardingOneReachLastPage());
    } else {
      emit(OnBoardingOneNotLastPage());
    }
  }
}


