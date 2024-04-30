part of 'home_bloc.dart';


abstract  class HomeState {}

final class HomeInitialState extends HomeState {}
class GetHomeBannersLoadingState extends HomeState{}
class GetHomeBannersSuccessfullyState extends HomeState{
  static List<Banners> ?data;
}
class GetHomeBannersErrorState extends HomeState{}
class GetHomeProductsLoadingState extends HomeState{

}
class GetHomeProductsSuccessfullyState extends HomeState{
  static List<Products> ?dataProducts;
}
class GetHomeProductsErrorState extends HomeState{}
class GetSearchDataLoadingState extends HomeState{}
class GetSearchDataSuccessfullyState extends HomeState{
  static List<DataList> ?searchData;
}
class GetSearchDataErrorState extends HomeState{}
class GetCategoriesDataLoadingState extends HomeState{}
class GetCategoriesDataSuccessfullyState extends HomeState{
  static List<CategoriesDataList> ?categoriesData;
}
class GetCategoriesDataErrorState extends HomeState{}
final class CartInitialState extends HomeState {}
final class AddRemoveCartLoadingState extends HomeState {}
final class AddRemoveCartErrorState extends HomeState {}
final class AddRemoveCartSuccessfullyState extends HomeState {
 static AddRemoveFromCartEntity  ?addRemoveDataFromCartEntity;
}
final class GetCartDataLoadingState extends HomeState {}
final class GetCartDataErrorState extends HomeState {}
final class GetCartDataSuccessfullyState extends HomeState {
  static DataGetCart ?cartData;
  static List<CartItemsList> ?cartList;
}
final class EditFavDataLoadingState extends HomeState{}
final class EditFavDataErrorState extends HomeState{}
final class EditFavDataSuccessfullyState extends HomeState{}
final class GetFavDataLoadingState extends HomeState{}
final class GetFavDataErrorState extends HomeState{}
final class GetFavDataSuccessfullyState extends HomeState{
}