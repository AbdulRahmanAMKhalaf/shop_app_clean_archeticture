import 'package:shop_app_clean_archeticture/Shop%20App/Core/ShardPrefrences/SharedPrefrences.dart';

class Constant{
  static String? token=SharedPrefrences.getStringData(key: 'savedToken');
  static bool? bourding = SharedPrefrences.getBoolData(key: 'savedBourding');

}