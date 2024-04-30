import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


class OnBoardingOneImages extends StatelessWidget {
  const OnBoardingOneImages({Key? key , required this.image,}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: Container(
        height: 1000,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
