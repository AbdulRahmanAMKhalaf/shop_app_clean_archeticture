import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnBoardingOneTexts extends StatelessWidget {
  const OnBoardingOneTexts({Key? key, required this.name, required this.text})
      : super(key: key);
  final String name;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Align(
        alignment: AlignmentDirectional.bottomStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Animate(
              effects: const [FadeEffect(), SlideEffect()],
              child: Text(name,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),)/*TextWidget(
                text: name,
                textColor: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w900,
              )*/,
            ),
            const SizedBox(height: 3,),
            Animate(
              effects: const [FadeEffect(), SlideEffect()],
              child:Text(text,style: TextStyle(color: Colors.white,fontSize:15,fontWeight: FontWeight.w400 ),) /*TextWidget(
                text: text,
                textColor: Colors.white,
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                maxLines: 3,
              )*/,
            ),
            const SizedBox(height: 7,),
          ],
        ),
      ),
    );
  }
}
