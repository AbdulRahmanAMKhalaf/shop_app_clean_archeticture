import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logoHero',
            child: Image(
              filterQuality: FilterQuality.high,
              image: AssetImage('Assets/Images/logo.png'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitCircle(
            color: Colors.black87,
            size: 40,
            duration: Durations.long1,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }
}
