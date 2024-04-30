import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/HomeBloc/home_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/SearchScreen/SearchScreenView/search_screen_view.dart';
import '../../../Core/Utils/Git It/Git It.dart';
import '../../Screen/HomeScreen/HomeScreenView/homeScreenView.dart';
import '../../Screen/ProfileScreen/ProfileScreenView/profileScreenView.dart';

part 'bottem_navigator_event.dart';
part 'bottem_navigator_state.dart';

class BottemNavigatorBloc extends Bloc<BottemNavigatorEvent, BottemState> {
  BottemNavigatorBloc() : super(BottemNavigatorInitialState()) {
    on<GetChangeBottemIcon>(changeBottemIcon);
  }

  List<BottomNavigationBarItem> bottemItem = [
    BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined,size: 25.px,),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search_rounded,size: 25.px,),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings,size: 25.px,),
      label: 'Setting',
    ),
  ];

  List<Widget> widgetScreen = [
    const HomeScreenView(),
    SearchScreenView(bloc: HomeBloc(sl(),sl(),sl(),sl(),sl(),)),
    const ProfileScreenView(),
  ];


static int index=0;


  FutureOr<void> changeBottemIcon(
      GetChangeBottemIcon event, Emitter<BottemState> emit) {
    index =event.tapIndex;
    emit(ChangeIconSuccessfullyStats());
  }
}
