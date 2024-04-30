

import 'package:either_dart/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Faliure/Faliure.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/BourdingField/BourdingEntity.dart';

class GetBourdingUseCase extends LocalBaseUseCase<List<BourdingEntity>,NoParameters>{
  BaseRepository baseRepository;

  GetBourdingUseCase(this.baseRepository);

  @override
  Either<Faliure, List<BourdingEntity>> call(NoParameters noParameters) {
    // TODO: implement call
    return this.baseRepository.getBourdingData(noParameters);
  }


}
