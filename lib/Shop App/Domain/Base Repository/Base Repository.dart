import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/BourdingField/BourdingEntity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/AddRemoveFromCart/add_remove_from_cart.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CategoriesField/categories_entity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/ChangePasswordEntity/ChangePasswordEntity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/RegisterField/RegisterEntity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/SearchEntity/search_entity.dart';
import '../../Core/Utils/Base UseCase/Base UseCase.dart';
import '../../Core/Utils/Faliure/Faliure.dart';
import '../Entity/CartField/GetCart/get_cart.dart';
import '../Entity/LoginField/LoginEntity.dart';
import '../Entity/LogoutField/LogoutField.dart';
import '../Entity/ProfileField/ProfileField.dart';
import '../HomeField/homeEntity.dart';

abstract class BaseRepository{
  Either<Faliure,List<BourdingEntity>> getBourdingData(NoParameters noParameters);
  Future<Either<Faliure,LoginEntity>>getLoginData(Parameters parameterData);
  Future<Either<Faliure,RegisterEntity>>getRegisterData(Parameters parameters);
  Future<Either<Faliure,ProfileEntity>>getProfileData(Parameters parameters);
  Future<Either<Faliure, LogoutEntity>>getLogoutData(Parameters parameters);
  Future<Either<Faliure, ChangePasswordEntity>>getChangePasswordData(Parameters parameters);
  Future<Either<Faliure,HomeEntity>> getHomeData(NoParameters noParameters);
  Future<Either<Faliure,CategoriesEntity>> getCategoriesData(NoParameters noParameters);
  Future<Either<Faliure,SearchEntity>> getSearchData(Parameters parameters);
  Future<Either<Faliure,AddRemoveFromCartEntity>> addRemoveCartData(Parameters parameters);
  Future<Either<Faliure,GetCartEntity>> getCartData(NoParameters noParameters);

}