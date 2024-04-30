part of 'bottem_navigator_bloc.dart';


abstract class BottemState {}

final class BottemNavigatorInitialState extends BottemState {}
final class ChangeIconLoadingStats extends BottemState{}
final class ChangeIconSuccessfullyStats extends BottemState{}
final class ChangeIconErrorStats extends BottemState{}