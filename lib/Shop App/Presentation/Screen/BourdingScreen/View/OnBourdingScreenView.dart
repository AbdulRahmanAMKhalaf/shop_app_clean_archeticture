import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Content/OnBourdingScreenContent.dart';

class OnBourdingScreenView extends StatelessWidget {
  const OnBourdingScreenView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBourdingScreenContent(),
    );
  }
}
