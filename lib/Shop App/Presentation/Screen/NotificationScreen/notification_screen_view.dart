import 'package:flutter/material.dart';

class NotificationScreenView extends StatelessWidget {
  const NotificationScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'no notification yet',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
