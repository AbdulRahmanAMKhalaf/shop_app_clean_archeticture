/*


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/LoginScreen.dart';

import '../../../Controller/OnBourdingCarlosBloc/on_bourding_bloc.dart';
import 'custom_floating_action_button.dart';

class OnBoardingOneButton extends StatelessWidget {
  const OnBoardingOneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc =context.read<OnBourdingCarlosBloc>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: CustomFloatingActionButton(
          onPressed: () {
            print(bloc.pageController);
            bloc.pageController!.nextPage(
                duration: const Duration(milliseconds: 800),
                curve: Curves.fastLinearToSlowEaseIn);
            if(bloc.state is OnBoardingOneReachLastPage){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              bloc.add(OnBoardingOneControllerDispose());
            }
          },
          heroTag: "onBoardingNext",
          iconData: Icons.arrow_forward_ios_rounded,
          backgroundColor: const Color(0xFFd17742),
        ),
      ),
    );
  }
}
*/
