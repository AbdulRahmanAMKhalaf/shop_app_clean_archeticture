import 'package:either_dart/either.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Base%20UseCase/Base%20UseCase.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Core/Utils/Faliure/Faliure.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Base%20Repository/Base%20Repository.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/CartField/AddRemoveFromCart/add_remove_from_cart.dart';

class AddRemoveCartUseCase extends RemoteBaseUseCase<AddRemoveFromCartEntity,Parameters>{
  BaseRepository baseRepository;

  AddRemoveCartUseCase(this.baseRepository);

  @override
  Future<Either<Faliure, AddRemoveFromCartEntity>> call(Parameters data) async{
    // TODO: implement call
    return await baseRepository.addRemoveCartData(data);
  }

}