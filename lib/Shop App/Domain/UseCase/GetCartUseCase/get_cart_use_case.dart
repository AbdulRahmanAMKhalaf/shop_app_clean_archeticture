import 'package:either_dart/src/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Faliure/Faliure.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';

import '../../Entity/CartField/GetCart/get_cart.dart';

class GetCartUseCase extends RemoteBaseUseCase<GetCartEntity,NoParameters>{
  BaseRepository baseRepository;

  GetCartUseCase(this.baseRepository);

  @override
  Future<Either<Faliure, GetCartEntity>> call(data)async {
    // TODO: implement call
    return await baseRepository.getCartData(data);
  }

}