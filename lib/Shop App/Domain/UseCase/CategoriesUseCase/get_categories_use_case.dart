import 'package:either_dart/src/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Faliure/Faliure.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CategoriesField/categories_entity.dart';

class GetCategoriesUseCase extends RemoteBaseUseCase<CategoriesEntity,NoParameters>{
  BaseRepository baseRepository;

  GetCategoriesUseCase(this.baseRepository);

  @override
  Future<Either<Faliure, CategoriesEntity>> call(NoParameters data) async{
    // TODO: implement call
    return await baseRepository.getCategoriesData(data);
  }

}