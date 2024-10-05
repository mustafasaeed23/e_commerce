import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/core/widgets/search_bar_with_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static const String routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Product Details",
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
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage("assets/icons/cart.png"),
                color: MyTheme.mainColor,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.blueGrey, width: 1.5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (_, index, __) {
                      return Image.asset(
                        "assets/icons/product.png",
                        height: 398.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      );
                    },
                    options:
                        CarouselOptions(autoPlay: true, viewportFraction: 1.1)),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Text(
                  "Nike Air Jordon",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp),
                ),
                const Spacer(),
                Text(
                  "EGP 3,500",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp),
                )
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 108.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Center(
                    child: Text(
                      "3,230 Sold",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyTheme.mainColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Row(
                  children: [
                    Image.asset("assets/icons/star_.png"),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "4.8 (7,500)",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: MyTheme.mainColor, fontSize: 14.sp),
                    )
                  ],
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  width: 102.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    color: MyTheme.mainColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove_circle_outline_rounded,
                            color: MyTheme.whiteColor,
                          )),
                      Text(
                        "1",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            color: MyTheme.whiteColor,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Description",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: MyTheme.mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
            ),
            ReadMoreText(
              "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories ",
              trimLines: 3,
              trimMode: TrimMode.Line,
              // style: readMoreTextStyle(),
              trimCollapsedText: "Show More",
              trimExpandedText: "Show Less",

              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Total price",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 18.sp,
                          ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "EGP 3,500",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: MyTheme.mainColor,
                            fontSize: 18.sp,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: MyTheme.mainColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: MyTheme.whiteColor,
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Add to cart",
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
