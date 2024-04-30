import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/BottemNavigator/bottem_navigator_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/OnBourdingBloc/on_bourding_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/SearchScreen/SearchScreenView/search_screen_view.dart';

import 'Shop App/Presentation/Screen/BottemNavigatorScreen/BottemView/bottem_navigation_bar_view.dart';
import 'Shop App/Presentation/Screen/SplashScreen/SplashScreen.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Widget screen;
  MyApp({super.key, required this.screen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BottemNavigatorBloc(),
        ),
        BlocProvider(
          create: (context) => OnBourdingBloc()..add(GetOnBourdingDataEvent()),
        ),
      ],
      child: ResponsiveSizer(
        builder: (p0, p1, p2) {
          return MaterialApp(
             initialRoute:'Splash',
            routes: {
              'Splash':(context) {
                return const SplashScreen();
              },
              '/home': (context) {
               return  screen;
              },
            },
            title: 'Shop App',
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            /*home: screen,*/
          );
        },
      ),
    );
  }
}
