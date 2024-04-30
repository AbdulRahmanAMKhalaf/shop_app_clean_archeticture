import 'package:shop_app_clean_archeticture/Shop%20App/Core/DioHelper/DioHelper.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Constant/Constant.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Controller/Controler.dart';
import '../../Core/Utils/Base UseCase/Base UseCase.dart';
import '../../Core/Utils/EndPoints/EndPoints.dart';
import '../../Core/Utils/ErrorModel/ErrorModel.dart';
import '../../Core/Utils/Exceptions/Exceptions.dart';
import '../Model/AddRemoveCartModel/add_remove_cart_model.dart';
import '../Model/CategoriesModel/categories_model.dart';
import '../Model/ChangePasswordModel/ChangePasswordModel.dart';
import '../Model/GetCartModels/get_cart_model.dart';
import '../Model/HomeModel/homeModel.dart';
import '../Model/LoginField/LoginModel.dart';
import '../Model/LogoutField/LogoutField.dart';
import '../Model/ProfileField/ProfileModel.dart';
import '../Model/RegisterModel/RegisterModel.dart';
import '../Model/SearchModel/search_model.dart';

abstract class BaseRemoteDataSource {
  Future<LoginModel> getLoginData(Parameters parameters);
  Future<RegisterModel> getRegisterData(Parameters parameters);
  Future<ProfileModel> getProfileData(Parameters parameters);
  Future<LogoutModel> getLogoutData(Parameters parameters);
  Future<ChangePasswordModel> getChangePasswordData(Parameters parameters);
  Future<HomeModel> getHomeData(NoParameters noParameters);
  Future<CategoriesModel> getCategoriesData(NoParameters noParameters);
  Future<SearchModel> getSearchData(Parameters parameters);
  Future<AddRemoveCartModel> getAddRemoveCartData(Parameters parameters);
  Future<GetCartModel> getCartData(NoParameters noParameters);
}

class RemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<LoginModel> getLoginData(Parameters parameters) async {
    // TODO: implement getLoginData
    final response = await DioHelper.postData(
        path: EndPoints.loginEndPoint,
        data: {'email': parameters.email, 'password': parameters.password});
    if (response.statusCode == 200) {
      return LoginModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJason(response.data));
    }
  }

  @override
  Future<RegisterModel> getRegisterData(Parameters parameters) async {
    // TODO: implement getRegisterData
    final response = await DioHelper.postData(
      path: EndPoints.registerEndPoint,
      data: {
        "name": parameters.name,
        "phone": parameters.phone,
        "email": parameters.email,
        "password": parameters.password,
      },
    );
    if (response.statusCode == 200) {
      return RegisterModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJason(response.data));
    }
  }

  @override
  Future<ProfileModel> getProfileData(Parameters parameters) async {
    // TODO: implement getProfileData
    final response = await DioHelper.getData(
      path: EndPoints.profileEndPoint,
      Authorization: parameters.autharization,
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJason(response.data));
    }
  }

  @override
  Future<LogoutModel> getLogoutData(Parameters parameters) async {
    // TODO: implement getLogoutData
    final response = await DioHelper.postData(
        path: EndPoints.logoutEndPoint, data: {"fcm_token": "SomeFcmToken"});
    if (response.statusCode == 200) {
      return LogoutModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJason(response.data));
    }
  }

  @override
  Future<ChangePasswordModel> getChangePasswordData(
      Parameters parameters) async {
    // TODO: implement getChangePasswordData
    final response = await DioHelper.postData(
        path: EndPoints.changePasswordEndPoint,
        Authorization: parameters.autharization,
        data: {
          "current_password": parameters.password,
          "new_password": parameters.newPassword,
        });
    if (response.statusCode == 200) {
      return ChangePasswordModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJason(response.data));
    }
  }

  @override
  Future<HomeModel> getHomeData(NoParameters noParameters) async {
    // TODO: implement getHomeData
    final response = await DioHelper.getData(
      path: '${EndPoints.mainEndPoint}${EndPoints.homeEndPoints}',
    );
    if (response.statusCode == 200) {
      return HomeModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: ErrorModel.fromJason(response.data));
    }
  }

  @override
  Future<CategoriesModel> getCategoriesData(NoParameters noParameters) async {
    // TODO: implement getCategoriesData
    final response = await DioHelper.getData(
        path: '${EndPoints.mainEndPoint}${EndPoints.categoriesEndPoints}');
    if (response.statusCode == 200) {
      return CategoriesModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<SearchModel> getSearchData(Parameters parameters) async {
    // TODO: implement getSearchData
    final response = await DioHelper.postData(
      path: '${EndPoints.mainEndPoint}${EndPoints.searchEndPoints}',
      Authorization: parameters.autharization,
      data: {
        "text": HomeController.searchController.text,
      },
    );
    if (response.statusCode == 200) {
      return SearchModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<AddRemoveCartModel> getAddRemoveCartData(Parameters parameters) async {
    // TODO: implement getAddRemoveCartData
    final response = await DioHelper.postData(
      path: EndPoints.mainEndPoint + EndPoints.cartEndPoints,
      data: {
        "product_id": parameters.id,
      },
      Authorization: parameters.autharization,
    );
    if (response.statusCode == 200) {
      return AddRemoveCartModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }

  @override
  Future<GetCartModel> getCartData(NoParameters noParameters) async {
    // TODO: implement getCartData
    final response = await DioHelper.getData(
      path: EndPoints.mainEndPoint + EndPoints.cartEndPoints,
      Authorization: Constant.token,
    );
    if (response.statusCode == 200) {
      return GetCartModel.fromJason(response.data);
    } else {
      throw ServerException(errorModel: response.data);
    }
  }
}
