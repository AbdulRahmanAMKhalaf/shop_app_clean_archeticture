// ignore_for_file: await_only_futures

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/DioHelper/DioHelper.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/BourdingScreen/View/OnBourdingScreenView.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/HomeScreen/HomeScreenView/homeScreenView.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/LoginScreen/LoginScreenView/LoginScreenView.dart';
import 'Shop App/Core/Utils/Constant/Constant.dart';
import 'Shop App/Presentation/Screen/BottemNavigatorScreen/BottemView/bottem_navigation_bar_view.dart';
import 'my_app.dart';
import 'Shop App/Core/Services/BlocObserver/blocObserver.dart';
import 'Shop App/Core/ShardPrefrences/SharedPrefrences.dart';
import 'Shop App/Core/Utils/Git It/Git It.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrences.sharedPref();
  Bloc.observer = MyBlocObserver();
  GitIIt().initalization();
  DioHelper.dio;
  Widget? screen;
  if (Constant.bourding != null) {
    // ignore: unnecessary_null_comparison
    if (Constant.token != null) {
      // print(Constant.token.toString());
      screen = const HomeScreenView()/*const BottemNavBarViewScreen.NavIBarViewScreen()*/;
    } else {
      // print(Constant.token.toString());
      screen = const LoginScreenView();
    }
  } else {
    // print(Constant.token.toString());
    screen = const OnBourdingScreenView();
  }
  runApp(MyApp(
    screen: screen,
  ));
}
