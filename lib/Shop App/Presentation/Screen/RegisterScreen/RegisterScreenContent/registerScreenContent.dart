import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/RegisterBloc/register_bloc.dart';
import '../../../../Core/Utils/Controller/Controler.dart';
import '../../../../Core/Utils/Keys/Keys.dart';

class RegisterScreenContent extends StatelessWidget {
  const RegisterScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegisterBloc>();
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
              left: 20,
              right: 20,
            ),
            child: Form(
              key: Keys.formRegisterKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 25.px,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Center(
                        child: Image(
                          height: 10.h,
                          width: 60.w,
                          fit: BoxFit.contain,
                          image: const AssetImage(
                            'Assets/Images/logo.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                    child: Text(
                      'Welcome to the A&A store',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.w700,
                        fontSize: 30.px,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    color: Colors.black,
                    height: 0.4.h,
                  ),
                  SizedBox(
                    height: 6.h,
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
                    keyboardType: TextInputType.text,
                    controller: RegisterController.registerNameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontSize: 20.px,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.lightBlue,
                        size: 25.px,
                      ),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Field';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    controller: RegisterController.registerPhoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                        fontSize: 20.px,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.lightBlue,
                        size: 25.px,
                      ),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
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
                    controller: RegisterController.registerEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                        fontSize: 20.px,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.lightBlue,
                        size: 25.px,
                      ),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return TextFormField(
                        maxLength: 10,
                        obscureText: RegisterBloc.isSecure,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required Field';
                          } else {
                            return null;
                          }
                        },
                        controller:
                            RegisterController.registerPasswordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 20.px,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.lightBlue,
                            size: 25.px,
                          ),
                          suffixIcon: BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              return IconButton(
                                  onPressed: () {
                                    bloc.add(GetChangeSecureIconEvent());
                                  },
                                  icon: Icon(
                                    RegisterBloc.isSecure
                                        ? Icons.shield
                                        : Icons.remove_moderator,
                                    color: Colors.lightBlue,
                                    size: 25,
                                  ));
                            },
                          ),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return ConditionalBuilder(
                        condition: state is! GetRegisterDataSuccessfullyState,
                        builder: (context) => Container(
                          height: 7.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                          child: MaterialButton(
                            onPressed: () {
                              if (Keys.formRegisterKey.currentState!
                                  .validate()) {
                                bloc.add(GetRegisterEvent(
                                    name: RegisterController
                                        .registerNameController.text,
                                    phone: RegisterController
                                        .registerPhoneController.text,
                                    email: RegisterController
                                        .registerEmailController.text,
                                    password: RegisterController
                                        .registerPasswordController.text));
                              }
                            },
                            child: const Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    },
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
