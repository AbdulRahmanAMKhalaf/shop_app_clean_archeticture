import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/HomeBloc/home_bloc.dart';

import '../../../../Core/Utils/Git It/Git It.dart';
import '../HomeScreenContent/homeScreenContent.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) =>
      HomeBloc(sl(),sl(),sl(),sl(),sl(),),
      child: const Scaffold(
        body:HomeScreenContent() ,
      ),
    );
  }
}
