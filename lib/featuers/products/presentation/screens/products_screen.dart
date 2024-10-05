import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/core/widgets/search_bar_with_cart.dart';
import 'package:e_commerce/featuers/products/presentation/screens/product_details_screen.dart';
import 'package:e_commerce/featuers/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const String routeName = '/products';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Image.asset(
              "assets/images/logo.png",
              color: MyTheme.mainColor,
              height: 22.h,
              width: 74.w,
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
              child: GridView.builder(
                padding: const EdgeInsets.all(1),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.25,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(ProductDetailsScreen.routeName);
                    },
                    child: const ProductItem(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
