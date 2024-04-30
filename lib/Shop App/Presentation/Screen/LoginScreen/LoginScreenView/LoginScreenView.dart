import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/LoginBloc/login_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/BottemNavigatorScreen/BottemView/bottem_navigation_bar_view.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/ProfileScreen/ProfileScreenView/profileScreenView.dart';
import '../../../../Core/Utils/Git It/Git It.dart';
import '../../HomeScreen/HomeScreenView/homeScreenView.dart';
import '../LoginScreenContent/LoginScreenContent.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(sl()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state is GetLoginDataSuccessfully) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const BottemNavBarViewScreen.NavIBarViewScreen(),
              ),
                  (route) => false);
          }
        },
        child: Scaffold(
          body: LoginScreenContent(),
        ),
      ),
    );
  }
}
