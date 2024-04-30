import 'package:get_it/get_it.dart' show GetIt;
import 'package:shop_app_clean_archeticture/Shop%20App/Data/Data%20Source/Local%20Data%20Source.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Data/Data%20Source/RemoteData%20Source.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Data/Repository/Rebository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/AddRemoveCartUseCase/add_remove_cart_use-CASE.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/BourdingUseCase/Get%20Bourding%20Data.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/CategoriesUseCase/get_categories_use_case.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/ChangePasswordUseCase/GetChangePasswodUseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/GetCartUseCase/get_cart_use_case.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/HomeUseCase/getHomeUseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/LoginUseCase/Get%20LoginUseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/RegisterUseCase/GetRegisterUseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/UseCase/SearchUseCase/search_us_case.dart';
import '../../../Domain/UseCase/LogoutUseCase/GetLogoutUseCase.dart';
import '../../../Domain/UseCase/ProfileUseCase/GetProfileDataUseCase.dart';

final sl = GetIt.instance;

class GitIIt {
  void initalization() {
    /// Bloc
    /* sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));*/
    /* sl.registerFactory<OnBourdingBloc>(() => OnBourdingBloc());*/
    /// Base Remote Data Source
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

    /// Base Local Data Source
    sl.registerLazySingleton<BaseLocalDataSource>(() => LocalDataSource());

    ///  Base Repository
    sl.registerLazySingleton<BaseRepository>(
        () => SecondRepository(sl(), sl()));

    /// UseCase
    sl.registerLazySingleton(() => GetLoginUseCase(sl()));
    sl.registerLazySingleton(() => GetBourdingUseCase(sl()));
    sl.registerLazySingleton(() => GetRegisterUseCase(sl()));
    sl.registerLazySingleton(() => GetProfileDataUseCase(sl()));
    sl.registerLazySingleton(() => GetChangePasswordUseCase(sl()));
    sl.registerLazySingleton(() => GetLogoutUseCase(sl()));
    sl.registerLazySingleton(() => GetHomeUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetSearchUseCase(sl()));
    sl.registerLazySingleton(() => AddRemoveCartUseCase(sl()));
    sl.registerLazySingleton(() => GetCartUseCase(sl()));

  }
}
