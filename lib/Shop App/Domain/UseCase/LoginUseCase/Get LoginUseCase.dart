import 'package:either_dart/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/LoginField/LoginEntity.dart';

import '../../../Core/Utils/Faliure/Faliure.dart';

class GetLoginUseCase extends RemoteBaseUseCase<LoginEntity,Parameters>{
  BaseRepository baseRepository;

  GetLoginUseCase(this.baseRepository);

  @override
  Future<Either<Faliure,LoginEntity>> call(Parameters parameterData) async{
    // TODO: implement call
    return await this.baseRepository.getLoginData(parameterData);
  }

}