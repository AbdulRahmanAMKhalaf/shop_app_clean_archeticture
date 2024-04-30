import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Constant/Constant.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CategoriesField/CategoriesDataList/categories_data_list.dart';
import '../../../Domain/Entity/CartField/AddRemoveFromCart/add_remove_from_cart.dart';
import '../../../Domain/Entity/CartField/GetCart/cart_items_list.dart';
import '../../../Domain/Entity/CartField/GetCart/data_get_cart.dart';
import '../../../Domain/Entity/SearchEntity/SearchDataEntity/data_list.dart';
import '../../../Domain/HomeField/banners.dart';
import '../../../Domain/HomeField/products.dart';
import '../../../Domain/UseCase/AddRemoveCartUseCase/add_remove_cart_use-CASE.dart';
import '../../../Domain/UseCase/CategoriesUseCase/get_categories_use_case.dart';
import '../../../Domain/UseCase/GetCartUseCase/get_cart_use_case.dart';
import '../../../Domain/UseCase/HomeUseCase/getHomeUseCase.dart';
import '../../../Domain/UseCase/SearchUseCase/search_us_case.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetHomeUseCase getHomeUseCase;
  GetSearchUseCase getSearchUseCase;
  GetCategoriesUseCase getCategoriesUseCase;
  AddRemoveCartUseCase addRemoveCartUseCase;
  GetCartUseCase getCartUseCase;

  HomeBloc(
      this.getHomeUseCase,
      this.getSearchUseCase,
      this.getCategoriesUseCase,
      /*  this.getFaveUseCase,*/
      this.addRemoveCartUseCase,
      this.getCartUseCase)
      : super(HomeInitialState()) {
    on<GetBannersHomeEvent>(getBanners);
    on<GetProductsHomeEvent>(getProductS);
    on<GetSearchDataEvent>(getSearchData);
    on<GetCategoriesDataEvent>(getCatigoriesData);
    on<AddRemoveCartEvent>(addRemoveCart);
    on<GetCartEvent>(getCartData);
  }

  /// Add_Remove_From_To_Cart

  FutureOr<void> addRemoveCart(
      AddRemoveCartEvent event, Emitter<HomeState> emit) async {
    emit(AddRemoveCartLoadingState());
    final result = await addRemoveCartUseCase(
        Parameters(id: event.id, autharization: Constant.token!));
    result.fold((left) {
      Fluttertoast.showToast(
        msg: left.errorMessage,
        fontSize: 20,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      emit(AddRemoveCartErrorState());
    }, (right) {
      if (right.status == true) {
        AddRemoveCartSuccessfullyState.addRemoveDataFromCartEntity = right;
        Fluttertoast.showToast(
          msg: right.message!,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.green,
          fontSize: 20,
        );
        emit(AddRemoveCartSuccessfullyState());
      } else {
        Fluttertoast.showToast(
          msg: right.message!,
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.red,
          fontSize: 20,
        );
        emit(AddRemoveCartErrorState());
      }
    });
  }

  /// Cart Data
  FutureOr<void> getCartData(
      GetCartEvent event, Emitter<HomeState> emit) async {
    emit(GetCartDataLoadingState());
    final result = await getCartUseCase(NoParameters());
    result.fold((left) {
      Fluttertoast.showToast(
        msg: left.errorMessage,
        fontSize: 20,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      emit(GetCartDataErrorState());
    }, (right) {
      if (right.status == true) {
        GetCartDataSuccessfullyState.cartData = right.data;
        GetCartDataSuccessfullyState.cartList = right.data.cartItems;
        Fluttertoast.showToast(
          msg: 'getCartSuccessfully',
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.green,
          fontSize: 20,
        );
        emit(GetCartDataSuccessfullyState());
      } else {
        Fluttertoast.showToast(
          msg: 'getCartError',
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.red,
          fontSize: 20,
        );
        emit(GetCartDataErrorState());
      }
    });
  }

  /// GeT Banners
  FutureOr<void> getBanners(
      GetBannersHomeEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeBannersLoadingState());
    final result = await getHomeUseCase(NoParameters());
    result.fold((left) {
      Fluttertoast.showToast(
          msg: left.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(GetHomeBannersErrorState());
    }, (right) {
      if (right.status == true) {
        GetHomeBannersSuccessfullyState.data = right.homeDataEntity.bannersList;
        Fluttertoast.showToast(
            msg: 'Get Banners Data Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(GetHomeBannersSuccessfullyState());
      } else {
        Fluttertoast.showToast(
            msg: 'Get Data Error',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(GetHomeBannersErrorState());
      }
    });
  }

  /// Get Products
  FutureOr<void> getProductS(
      GetProductsHomeEvent event, Emitter<HomeState> emit) async {
    emit(GetHomeProductsLoadingState());
    final result = await getHomeUseCase(NoParameters());
    result.fold((left) {
      Fluttertoast.showToast(
          msg: left.errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(GetHomeProductsErrorState());
    }, (right) {
      if (right.status == true) {
        GetHomeProductsSuccessfullyState.dataProducts =
            right.homeDataEntity.productsList;
        Fluttertoast.showToast(
            msg: 'Get Data Successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(GetHomeProductsSuccessfullyState());
      } else {
        Fluttertoast.showToast(
            msg: 'Get Data Error',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(GetHomeBannersErrorState());
      }
    });
  }

  /// Search Data
  FutureOr<void> getSearchData(
      GetSearchDataEvent event, Emitter<HomeState> emit) async {
    emit(GetSearchDataLoadingState());
    final result =
        await getSearchUseCase(Parameters(autharization: event.authorization));
    result.fold((left) {
      Fluttertoast.showToast(
        msg: left.errorMessage,
        fontSize: 15,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      emit(GetSearchDataErrorState());
    }, (right) {
      if (right.status == true) {
        GetSearchDataSuccessfullyState.searchData = right.searchDataEntity.data;
        Fluttertoast.showToast(
          msg: 'search Successfully',
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          backgroundColor: Colors.green,
          fontSize: 15,
        );
        emit(GetSearchDataSuccessfullyState());
      }
    });
  }

  /// Categories Data
  FutureOr<void> getCatigoriesData(
      GetCategoriesDataEvent event, Emitter<HomeState> emit) async {
    emit(GetCategoriesDataLoadingState());

    final result = await getCategoriesUseCase(NoParameters());
    result.fold((left) {
      Fluttertoast.showToast(
        msg: left.errorMessage,
        fontSize: 15,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      emit(GetCategoriesDataErrorState());
    }, (right) {
      GetCategoriesDataSuccessfullyState.categoriesData = right.data.dataList;
      Fluttertoast.showToast(
        msg: 'search Successfully',
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        backgroundColor: Colors.green,
        fontSize: 15,
      );
      emit(GetCategoriesDataSuccessfullyState());
    });
  }
}
