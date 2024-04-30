import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Controller/OnBourdingBloc/on_bourding_bloc.dart';
import '../../LoginScreen/LoginScreenView/LoginScreenView.dart';

class OnBourdingScreenContent extends StatelessWidget {
  const OnBourdingScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBourdingBloc, OnBourdingState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: OnBourdingBloc.bloc(context).bourdingData.length,
              controller: OnBourdingBloc.bloc(context).pageController,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: 35.h,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl:
                          OnBourdingBloc.bloc(context).bourdingData[index].Image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    OnBourdingBloc.bloc(context).bourdingData[index].headTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.px,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    '${OnBourdingBloc.bloc(context).bourdingData[index].overView}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.px,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      fontFamily: 'Archivo',
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        effect: JumpingDotEffect(
                          spacing: 3.w,
                          radius: 3.px,
                          dotWidth: 4.w,
                          dotHeight: 2.h,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.blue,
                        ),
                        controller: OnBourdingBloc.bloc(context).pageController,
                        count: OnBourdingBloc.bloc(context).bourdingData.length,
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed:(){
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder:(context) => const LoginScreenView(),
                                ),
                                    (route) => false);
                          },
                          child:const Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.black
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
