import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Controller/HomeBloc/home_bloc.dart';
import '../ScreenSearchContent/search-screen_content.dart';

class SearchScreenView extends StatelessWidget {
   SearchScreenView({super.key,required this.bloc});
  HomeBloc bloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:bloc,
      child:  Scaffold(
        appBar: AppBar(),
        body: const SearchScreenContent(),
      ),
    );
  }
}
