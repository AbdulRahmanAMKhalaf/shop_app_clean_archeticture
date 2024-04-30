import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Controller/HomeBloc/home_bloc.dart';
import 'package:shop_app_clean_archeticture/Shop%20App/Presentation/Screen/CheckoutScreen/checkout_screen.dart';

class DetailsScreenView extends StatelessWidget {
  DetailsScreenView({super.key, required this.homeBloc, required this.index});
  HomeBloc homeBloc;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                  onPressed: () {
                    homeBloc.add(AddRemoveCartEvent(
                        id:GetHomeProductsSuccessfullyState.dataProducts![index].id));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              width: 5.w,
            ),
            Container(
              width: 70.w,
              height: 7.h,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {
                  homeBloc.add(GetCartEvent());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreenView(
                        homeBloc: homeBloc,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Details',
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
                Icons.favorite_border,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: double.infinity,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(GetHomeProductsSuccessfullyState.dataProducts![index].image),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      child: Text(
                        maxLines: 1,
                        '-${GetHomeProductsSuccessfullyState.dataProducts![index].name}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${GetHomeProductsSuccessfullyState.dataProducts![index].price}\$',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  GetHomeProductsSuccessfullyState.dataProducts![index].description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
