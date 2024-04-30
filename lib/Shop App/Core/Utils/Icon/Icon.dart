/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Presentation/Controller/login_bloc.dart';
import '../../../Presentation/Screen/CarlosScreens/LoginScreen.dart';
import '../Controller/Controler.dart';

class BourdingIcon{
  static Icon iconBourdingNextPage=Icon(
    Icons.arrow_forward_ios,
    color: Colors.black,
    size: 25,
  );
  static IconButton iconButtonBourdingNextPage(BuildContext context){
    return IconButton(
        onPressed: () {
          LoginBloc.pageNumber++;
          if(LoginBloc.pageNumber<3)
            BourdingController.pageBourdingController.nextPage(
                duration: Durations.long1,
                curve: Curves.linear);
          else
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                )
            );
        },
        icon: BourdingIcon.iconBourdingNextPage
    );
  }

}*/
