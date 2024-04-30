import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/HomeBloc/home_bloc.dart';

class CheckoutScreenView extends StatelessWidget {
  CheckoutScreenView({super.key, required this.homeBloc});
  HomeBloc homeBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 35.h,
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: GetCartDataSuccessfullyState.cartList != null && state is GetCartDataSuccessfullyState,
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'subTotals for products:',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${GetCartDataSuccessfullyState.cartData!.subTotal}\$',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Delivery subTotals:',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '5\$',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Discount vouchers:',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '0\$',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 0.2.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          const Text(
                            'total:',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${GetCartDataSuccessfullyState.cartData!.total}\$',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        height: 7.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Center(
                            child: Text(
                              'Checkout',
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        ),
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Checkout',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition: GetCartDataSuccessfullyState.cartList != null && state is GetCartDataSuccessfullyState,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    height: 16.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Container(
                            width: 25.w,
                            height: 13.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  GetCartDataSuccessfullyState
                                      .cartList![index].productGetCart.image,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 7.h,
                                width: 40.w,
                                child: Text(
                                  GetCartDataSuccessfullyState
                                      .cartList![index].productGetCart.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.px,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    '${GetCartDataSuccessfullyState.cartList![index].productGetCart.price}\$',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Container(
                                              width: 7.w,
                                              height: 3.h,
                                              decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.black87,
                                                size: 25.px,
                                              ))),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 20.px,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Container(
                                              width: 7.w,
                                              height: 3.h,
                                              decoration: BoxDecoration(
                                                color: Colors.blueAccent,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black87,
                                                size: 25.px,
                                              ))),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 3.h,
                  ),
                  itemCount: GetCartDataSuccessfullyState.cartList!.length,
                ),
              ),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
