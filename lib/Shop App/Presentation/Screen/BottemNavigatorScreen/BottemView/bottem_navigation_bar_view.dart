import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/BottemNavigator/bottem_navigator_bloc.dart';

class BottemNavBarViewScreen extends StatelessWidget {
  const BottemNavBarViewScreen.NavIBarViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<BottemNavigatorBloc>();
    return BlocBuilder<BottemNavigatorBloc, BottemState>(
      builder: (context, state) {
        return Scaffold(
          body: bloc.widgetScreen[BottemNavigatorBloc.index],
          bottomNavigationBar: BottomNavigationBar(
            items: bloc.bottemItem,
            currentIndex: BottemNavigatorBloc.index,
            onTap: (value) {
              bloc.add(GetChangeBottemIcon(tapIndex: value));
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }
}
