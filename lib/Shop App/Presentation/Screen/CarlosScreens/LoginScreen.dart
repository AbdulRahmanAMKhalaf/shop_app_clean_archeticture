/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/Utils/Git It/Git It.dart';
import '../Component/LoginButtonComponent.dart';
import '../Controller/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logoHero',
                   */
/* flightShuttleBuilder: (flightContext, animation,
                            flightDirection, fromHeroContext, toHeroContext) =>
                        AnimatedAlign(
                            alignment: Alignment.topCenter,
                            duration: Duration(seconds: 3)),*//*

                    child: Image(
                      filterQuality: FilterQuality.high,
                      image: AssetImage('Assets/Images/logo.png'),
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 2,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
                    maxLines: 1,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Required Field';
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: passwordController,
                    maxLines: 1,
                    autocorrect: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shield,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Required Field';
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginButtonComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/
