import 'package:shop_app_clean_archeticture/Shop%20App/Domain/Entity/BourdingField/BourdingEntity.dart';
import '../../Core/Utils/BourdingData/BourdingData.dart';
import '../../Core/Utils/Exceptions/Exceptions.dart';

abstract class BaseLocalDataSource{
  List<BourdingEntity> getBourdingData();
}
class LocalDataSource extends BaseLocalDataSource{
  @override
  List<BourdingEntity> getBourdingData() {
    // TODO: implement getBourdingData
    List<BourdingEntity> response=[];
    bourdingData.forEach((element) {
      response.add(element);
    });
    if(response!=null)
      return response;
    else
      throw LocalException(errorMessage: 'Local Error at Bourding Data List');
  }

}
