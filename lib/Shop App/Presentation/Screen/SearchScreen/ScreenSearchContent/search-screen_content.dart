import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/HomeBloc/home_bloc.dart';
import '../../../../Core/Utils/Constant/Constant.dart';
import '../../../../Core/Utils/Controller/Controler.dart';

class SearchScreenContent extends StatelessWidget {
  const SearchScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return TextFormField(
                controller: HomeController.searchController,
                onChanged: (value) {
                  bloc.add(GetSearchDataEvent(authorization: Constant.token!));
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search, size: 30, color: Colors.black,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 2.h,),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (HomeController.searchController.text != '') {
                return Expanded(
                  child: ConditionalBuilder(
                    condition: GetSearchDataSuccessfullyState.searchData!=null ,
                    builder: (context) => ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: NetworkImage(
                                          GetSearchDataSuccessfullyState.searchData![index].image
                                      ),
                                      height: 60.px,
                                      width: 60.px,
                                    ),
                                  ),
                                  SizedBox(width: 3.w,),
                                  SizedBox(
                                    width: 50.w,
                                    height: 5.h,
                                    child: Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      GetSearchDataSuccessfullyState.searchData![index].name,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 4.h,),
                        itemCount: GetSearchDataSuccessfullyState.searchData!.length),
                    fallback:(context) => const Center(child: CircularProgressIndicator()),
                  ),
                );
              } else {
                return const Expanded(
                  child: Center(
                    child: Text(
                      'Please search about what you want',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
