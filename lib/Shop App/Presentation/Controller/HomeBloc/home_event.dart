part of 'home_bloc.dart';


abstract class HomeEvent {}
final class GetBannersHomeEvent extends HomeEvent{
  String Authorized;

  GetBannersHomeEvent({required this.Authorized});
}
final class GetProductsHomeEvent extends HomeEvent{
  String Authorized;

  GetProductsHomeEvent({required this.Authorized});
}
final class GetSearchDataEvent extends HomeEvent{
  String authorization;

  GetSearchDataEvent({required this.authorization});
}
final class GetCategoriesDataEvent extends HomeEvent{
  String authorization;

  GetCategoriesDataEvent({required this.authorization});
}
final class AddRemoveCartEvent extends HomeEvent{
  int id;

  AddRemoveCartEvent({required this.id});
}
final class RemoveFromCartEvent extends HomeEvent{
  int id;

  RemoveFromCartEvent({required this.id});
}
final class GetCartEvent extends HomeEvent{}
final class EditFavData extends HomeEvent{
  int id;

  EditFavData({required this.id});
}
final class GetFavData extends HomeEvent{

}