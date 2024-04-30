/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/OnBourdingScreen/widgets/on_boarding_one_button.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/OnBourdingScreen/widgets/on_boarding_one_images.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/OnBourdingScreen/widgets/on_boarding_one_texts.dart';

import '../../Controller/OnBourdingCarlosBloc/on_bourding_bloc.dart';

class BourdingScreenContent extends StatelessWidget {
  const BourdingScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<OnBourdingCarlosBloc>();
    return Stack(
      children: [
        BlocBuilder<OnBourdingCarlosBloc, OnBourdingState>(
          builder: (context, state) {
            return PageView.builder(
              controller: bloc.pageController,
              itemCount: 3,
              onPageChanged: (index) {
                bloc.add(OnBoardingOneNextPage(index));
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    OnBoardingOneImages(
                      image: bloc.onBoardingOneModel[index].Image,
                    ),
                    OnBoardingOneTexts(
                        name: bloc.onBoardingOneModel[index].headTitle,
                        text: bloc.onBoardingOneModel[index].overView),
                  ],
                );
              },
            );
          },
        ),
        const OnBoardingOneButton(),
      ],
    );
  }
}
*/
