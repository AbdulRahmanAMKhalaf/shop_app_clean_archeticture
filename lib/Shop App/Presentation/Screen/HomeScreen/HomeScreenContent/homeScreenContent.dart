import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/SearchScreen/SearchScreenView/search_screen_view.dart';
import '../../../../Core/Utils/Controller/Controler.dart';
import '../../../Controller/HomeBloc/home_bloc.dart';
import '../../../Controller/ProfileController/profile_bloc.dart';
import '../../DetailsScreen/details_screen_view.dart';
import '../../NotificationScreen/notification_screen_view.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    bloc.add(GetBannersHomeEvent(Authorized: 'Authorized'));
    bloc.add(GetCategoriesDataEvent(authorization: 'authorization'));
    bloc.add(GetProductsHomeEvent(Authorized: 'Authorized'));
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.px),
                        ),
                        Text(
                          'Carlos',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 20.px),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton.filledTonal(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder:(context) => SearchScreenView(bloc: bloc,),
                              ),
                          );
                        },
                        icon:  const Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                          size: 30,
                        )),
                    SizedBox(
                      width: 3.w,
                    ),
                    IconButton.filledTonal(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NotificationScreenView(),
                              ),
                          );
                        },
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                          size: 30,
                        )),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return Container(
                      height: 30.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ConditionalBuilder(
                        condition:GetHomeBannersSuccessfullyState.data!=null,
                        builder: (context) => CarouselSlider.builder(
                          carouselController: HomeController.carouselController,
                          itemCount:GetHomeBannersSuccessfullyState.data!.length,
                          itemBuilder: (context, index, realIndex) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(
                                  GetHomeBannersSuccessfullyState.data![index].image!
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                            scrollPhysics: const NeverScrollableScrollPhysics(),
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            initialPage: 0,
                            viewportFraction: 1,
                            animateToClosest: true,
                          ),
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                 const Row(
                   children: [
                     Text(
                      'Categories',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                                     ),
                     Spacer(),
                     Text(
                       'See all',
                       textAlign: TextAlign.left,
                       style: TextStyle(
                         color: Colors.blue,
                         fontWeight: FontWeight.w700,
                         fontSize: 17,
                       ),
                     ),
                   ],
                 ),
                SizedBox(
                  height: 1.h,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: ConditionalBuilder(
                        condition:GetCategoriesDataSuccessfullyState.categoriesData!=null,
                        builder: (context) => ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 53.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image(
                                          image: NetworkImage(
                                            GetCategoriesDataSuccessfullyState.categoriesData![index].image,
                                          ),
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Center(
                                        child: Text(
                                          GetCategoriesDataSuccessfullyState.categoriesData![index].name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 5.w,
                                ),
                            itemCount: GetCategoriesDataSuccessfullyState.categoriesData!.length),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                const Row(
                  children: [
                    Text(
                      'Products',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See all',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ConditionalBuilder(
                      condition: GetHomeProductsSuccessfullyState.dataProducts!=null,
                      builder: (context) => Padding(
                          padding: const EdgeInsets.only(
                              top: 7, bottom: 7, left: 5, right: 5),
                          child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            crossAxisSpacing: 2.w,
                            mainAxisSpacing: 0.1.h,
                            childAspectRatio: 1 / 1.6,
                            children: List.generate(GetHomeProductsSuccessfullyState.dataProducts!.length,
                                (index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap:(){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder:(context) =>  DetailsScreenView(homeBloc: bloc,index: index,),
                                          ),
                                      );
                                    },
                                    child: Container(
                                      width:double.infinity,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: Offset(1, 2)
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              GetHomeProductsSuccessfullyState.dataProducts![index].image
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.h,),
                                  Text(
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    GetHomeProductsSuccessfullyState.dataProducts![index].name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20
                                    ),
                                  ),
                                  SizedBox(height: 2.h,),
                                  Row(
                                    children: [
                                      if(GetHomeProductsSuccessfullyState.dataProducts![index].discount!=0)
                                        Text(
                                          '${GetHomeProductsSuccessfullyState.dataProducts![index].oldPrice}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.red,
                                              decoration: TextDecoration.lineThrough
                                          ),
                                        ),
                                      const Spacer(),
                                      Text(
                                        '${GetHomeProductsSuccessfullyState.dataProducts![index].price}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,

                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          )),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
