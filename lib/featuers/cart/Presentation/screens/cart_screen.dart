import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/core/widgets/error_indicator.dart';
import 'package:e_commerce/core/widgets/loading_indicator.dart';
import 'package:e_commerce/featuers/cart/Presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/featuers/cart/Presentation/cubit/cart_state.dart';
import 'package:e_commerce/featuers/cart/Presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<CartCubit>()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: MyTheme.mainColor,
              )),
          title: Text(
            "Cart",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: MyTheme.mainColor,
                  fontSize: 20.sp,
                ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage("assets/icons/icon _search_.png"),
                  color: MyTheme.mainColor,
                )),
            
          ],
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is GetCartLoading) {
              return const LoadingIndicator();
            } else if (state is GetCartError) {
              return ErrorIndicator(state.message);
            } else if (state is GetCartSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem(
                            state.cartEntity.products[index],
                          );
                        },
                        itemCount: state.cartEntity.products.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Total Price",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: MyTheme.mainColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "EGP ${state.cartEntity.totalCartPrice}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: MyTheme.mainColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: Container(
                              width: 100.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: MyTheme.mainColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Check Out",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontSize: 20.sp),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  ImageIcon(
                                      color: Colors.white,
                                      size: 25.sp,
                                      const AssetImage(
                                          "assets/icons/next_icon.png"))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Text("Cart is Empty");
            }
          },
        ),
      ),
    );
  }
}
