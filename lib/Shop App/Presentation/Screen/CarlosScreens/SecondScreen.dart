import 'package:flutter/cupertino.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
          image: AssetImage('Assets/Images/logo.png')
      ),
    );
  }
}
