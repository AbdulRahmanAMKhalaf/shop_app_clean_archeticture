
abstract class Faliure{
  String errorMessage;

  Faliure(this.errorMessage);
}
class ServerFaliure extends Faliure{
  ServerFaliure(super.errorMessage);

}

class LocalFaliure extends Faliure{
  LocalFaliure(super.errorMessage);

}

class ManuallyFaliure extends Faliure{

  ManuallyFaliure(super.errorMessage);
}