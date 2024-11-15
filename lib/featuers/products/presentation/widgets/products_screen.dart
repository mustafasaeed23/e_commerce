import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/widgets/error_indicator.dart';
import 'package:e_commerce/core/widgets/loading_indicator.dart';
import 'package:e_commerce/core/widgets/search_bar_with_cart.dart';
import 'package:e_commerce/featuers/products/presentation/cubit/products_cubit.dart';
import 'package:e_commerce/featuers/products/presentation/cubit/products_state.dart';
import 'package:e_commerce/featuers/products/presentation/screens/product_details_screen.dart';
import 'package:e_commerce/featuers/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  static const String routeName = '/products';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<ProductsCubit>()..getProducts(),
      child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  color: Theme.of(context).primaryColor,
                  height: 22.h,
                  width: 66.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 18.h,
                ),
                const SearchBarWithCart(),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsLoadingState) {
                        return const LoadingIndicator();
                      } else if (state is ProductsFailureState) {
                        return ErrorIndicator(state.message);
                      } else if (state is ProductsSuccessState) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3.1,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.w,
                          ),
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ProductDetailsScreen.routeName,
                                  arguments: state.productsList[index]);
                            },
                            child: ProductItem(state.productsList[index]),
                          ),
                          itemCount: state.productsList.length,
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
