import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

class BourdingController{
  static PageController pageBourdingController = PageController();

}
class LoginController{
  static TextEditingController loginEmailController=TextEditingController();
  static TextEditingController loginPasswordController=TextEditingController();
}

class RegisterController{
  static TextEditingController registerEmailController=TextEditingController();
  static TextEditingController registerPasswordController=TextEditingController();
  static TextEditingController registerPhoneController=TextEditingController();
  static TextEditingController registerNameController=TextEditingController();

}

class ProfileController{
  static TextEditingController profileCurrentPassword=TextEditingController();
  static TextEditingController profileNewPassword=TextEditingController();
}

class HomeController{
  static PageController bannerController=PageController();
  static TextEditingController searchController=TextEditingController();
  static CarouselController carouselController=CarouselController();
}