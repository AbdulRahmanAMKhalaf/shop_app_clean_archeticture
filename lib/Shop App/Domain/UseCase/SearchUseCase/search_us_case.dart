import 'package:either_dart/src/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Faliure/Faliure.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/SearchEntity/search_entity.dart';

class GetSearchUseCase extends RemoteBaseUseCase<SearchEntity,Parameters>{
  BaseRepository baseRepository;

  GetSearchUseCase(this.baseRepository);

  @override
  Future<Either<Faliure, SearchEntity>> call(Parameters data) async{
    // TODO: implement call
    return await baseRepository.getSearchData(data);
  }
}