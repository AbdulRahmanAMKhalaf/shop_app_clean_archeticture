
import '../ErrorModel/ErrorModel.dart';

class ServerException implements Exception{
  ErrorModel errorModel;

  ServerException({required this.errorModel});
}
class LocalException implements Exception{
  String errorMessage;

  LocalException({required this.errorMessage});
}
class ManuallyException implements Exception{
  String errorMessage;

  ManuallyException(this.errorMessage);
}