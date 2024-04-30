import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Controller/Controler.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/RegisterScreen/RegisterScreenView/registerScreenView.dart';
import '../../../../Core/Utils/Keys/Keys.dart';
import '../../../Controller/LoginBloc/login_bloc.dart';

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<LoginBloc>();
    return SafeArea(
      child: Padding(
        padding:
        const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: Keys.formLoginrKey,
              child: Column(
                children: [
                  SizedBox(
                    width: 70.w,
                    child: const Image(
                      image: AssetImage(
                        'Assets/Images/logo.png',
                      ),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 50.px,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.blue.shade300,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Field';
                      } else {
                        return null;
                      }
                    },
                    controller: LoginController.loginEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.blue,
                        size: 30.px,
                      ),
                      labelText: 'Email Address',
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                          fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          } else {
                            return null;
                          }
                        },
                        controller: LoginController.loginPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: LoginBloc.isSecure,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.blue,
                            size: 30.px,
                          ),
                          suffixIcon: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return IconButton(
                                onPressed: () {
                                  bloc.add(GetChangeSecureIconEvent());
                                },

                                icon: Icon(
                                  LoginBloc.isSecure ? Icons.shield : Icons
                                      .remove_moderator,
                                  color: Colors.blue,
                                  size: 30.px,
                                ),
                              );
                            },
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                              fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Container(
                        height: 7.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey),
                        child: MaterialButton(
                          onPressed: () {
                            if (Keys.formLoginrKey.currentState!.validate()) {
                              bloc.add(GetLoginDataEvent(
                                  emailAddress:
                                  LoginController.loginEmailController.text,
                                  password: LoginController
                                      .loginPasswordController.text));
                            }
                          },
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'don\'t have account ?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.px,
                    ),
                  ),
                  TextButton(
                    style: const ButtonStyle(
                        visualDensity: VisualDensity.compact),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreenView(),
                          ));
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.px,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
