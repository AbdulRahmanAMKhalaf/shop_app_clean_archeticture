import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Constant/Constant.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/ProfileController/profile_bloc.dart';
import '../../../../Core/Utils/Controller/Controler.dart';

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc1 = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is GetProfileDataSuccessfullyState || state is ChangePasswordSuccessfullyState,
          builder: (context) => SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10, left: 20, bottom: 20, top: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            bloc1.add(GetLogoutEvent(Constant.token!));
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: 30.px,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50.px,
                        child: const Image(
                          image: NetworkImage(
                            'https://th.bing.com/th/id/OIP.1yoSL-WO0YU5mQKROudvswHaHa?w=194&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
                          ),
                        ),
                      ),
                      Text(
                        'ID : ${GetProfileDataSuccessfullyState.profileEntity!.dataLoginEntity?.id} ',
                        style: TextStyle(
                          fontSize: 20.px,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue.shade200,
                        ),
                        height: 8.h,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Name : ${GetProfileDataSuccessfullyState.profileEntity?.dataLoginEntity?.name}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue.shade200,
                        ),
                        height: 8.h,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Email : ${GetProfileDataSuccessfullyState.profileEntity?.dataLoginEntity?.email}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue.shade200,
                        ),
                        height: 8.h,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Phone : ${GetProfileDataSuccessfullyState.profileEntity?.dataLoginEntity?.phone}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Change Password',
                        style: TextStyle(
                            fontSize: 20.px, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 37.w,
                            child: TextFormField(
                              controller:
                                  ProfileController.profileCurrentPassword,
                              maxLength: 10,
                              decoration: InputDecoration(
                                hintText: 'Current Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: 37.w,
                            child: TextFormField(
                              controller: ProfileController.profileNewPassword,
                              maxLength: 10,
                              decoration: InputDecoration(
                                hintText: 'New Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 7.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightBlue.shade100),
                        child: MaterialButton(
                          onPressed: () {
                            bloc1.add(
                              GetChangePasswordEvent(
                                  currentPassword: ProfileController
                                      .profileCurrentPassword.text,
                                  newPassword: ProfileController
                                      .profileNewPassword.text),
                            );
                          },
                          child: const Center(
                            child: Text(
                              'Change',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
