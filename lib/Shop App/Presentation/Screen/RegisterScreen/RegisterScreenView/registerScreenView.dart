import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/HomeScreen/HomeScreenView/homeScreenView.dart';
import '../../../../Core/Utils/Git It/Git It.dart';
import '../../../Controller/RegisterBloc/register_bloc.dart';
import '../../BottemNavigatorScreen/BottemView/bottem_navigation_bar_view.dart';
import '../RegisterScreenContent/registerScreenContent.dart';

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(sl()),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is GetRegisterDataSuccessfullyState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder:(context) => const BottemNavBarViewScreen.NavIBarViewScreen(),
                ),
            );
          }
        },
        child: const Scaffold(
          body: RegisterScreenContent(),
        ),
      ),
    );
  }
}
