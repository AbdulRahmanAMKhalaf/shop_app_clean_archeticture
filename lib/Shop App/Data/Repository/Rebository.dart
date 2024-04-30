import 'package:either_dart/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Data/Data%20Source/Local%20Data%20Source.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Data/Model/HomeModel/homeModel.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/BourdingField/BourdingEntity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/AddRemoveFromCart/add_remove_from_cart.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CategoriesField/categories_entity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/ChangePasswordEntity/ChangePasswordEntity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/LoginField/LoginEntity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/LogoutField/LogoutField.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/ProfileField/ProfileField.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/RegisterField/RegisterEntity.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/SearchEntity/search_entity.dart';
import '../../Core/Utils/Base UseCase/Base UseCase.dart';
import '../../Core/Utils/Exceptions/Exceptions.dart';
import '../../Core/Utils/Faliure/Faliure.dart';
import '../../Domain/Entity/CartField/GetCart/get_cart.dart';
import '../Data Source/RemoteData Source.dart';

class SecondRepository extends BaseRepository {
  BaseLocalDataSource baseLocalDataSource;
  BaseRemoteDataSource baseRemoteDataSource;

  SecondRepository(this.baseLocalDataSource, this.baseRemoteDataSource);

  @override
  Future<Either<Faliure, LoginEntity>> getLoginData(
      Parameters parameterData) async {
    // TODO: implement getLoginData
    final result = await baseRemoteDataSource.getLoginData(parameterData);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Either<Faliure, List<BourdingEntity>> getBourdingData(
      NoParameters noParameters) {
    // TODO: implement getBourdingData
    final result = baseLocalDataSource.getBourdingData();
    try {
      return Right(result);
    } on LocalException catch (error) {
      return Left(LocalFaliure(error.errorMessage));
    }
  }

  @override
  Future<Either<Faliure, RegisterEntity>> getRegisterData(
      Parameters parameters) async {
    // TODO: implement getRegisterData
    final result = await baseRemoteDataSource.getRegisterData(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, ProfileEntity>> getProfileData(
      Parameters parameters) async {
    // TODO: implement getProfileData
    final result = await baseRemoteDataSource.getProfileData(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, LogoutEntity>> getLogoutData(
      Parameters parameters) async {
    // TODO: implement getLogoutData
    final result = await baseRemoteDataSource.getLogoutData(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, ChangePasswordEntity>> getChangePasswordData(
      Parameters parameters) async {
    // TODO: implement getChangePasswordData
    final result = await baseRemoteDataSource.getChangePasswordData(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, HomeModel>> getHomeData(
      NoParameters noParameters) async {
    // TODO: implement getHomeData
    final result = await baseRemoteDataSource.getHomeData(noParameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, CategoriesEntity>> getCategoriesData(
      NoParameters noParameters) async {
    // TODO: implement getCategoriesData
    final result = await baseRemoteDataSource.getCategoriesData(noParameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, SearchEntity>> getSearchData(
      Parameters parameters) async {
    // TODO: implement getSearchData
    final result = await baseRemoteDataSource.getSearchData(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, AddRemoveFromCartEntity>> addRemoveCartData(
      Parameters parameters) async {
    // TODO: implement addRemoveCartData
    final result = await baseRemoteDataSource.getAddRemoveCartData(parameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }

  @override
  Future<Either<Faliure, GetCartEntity>> getCartData(
      NoParameters noParameters) async {
    // TODO: implement getCartData
    final result = await baseRemoteDataSource.getCartData(noParameters);
    try {
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFaliure(error.errorModel.message!));
    }
  }
}
