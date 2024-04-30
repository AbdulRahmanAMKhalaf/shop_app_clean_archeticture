import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Constant/Constant.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/LoginScreen/LoginScreenView/LoginScreenView.dart';
import '../../../../Core/Utils/Git It/Git It.dart';
import '../../../Controller/ProfileController/profile_bloc.dart';
import '../ProfileScreenContent/profileScreenContent.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProfileBloc(sl(), sl(), sl())
        ..add(GetProfileDataEvent(authorized: Constant.token!)),
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
          if(state is LogoutSuccessfullyState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder:(context) => const LoginScreenView(),
                ),
                    (route) => false);
          }
        },
        child: Scaffold(
          body: ProfileScreenContent(),
        ),
      ),
    );
  }
}
