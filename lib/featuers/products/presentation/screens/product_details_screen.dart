import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/cart/Presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/featuers/products/Domain/Entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String routeName = '/product_details';
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final cartCubit = serviceLocator.get<CartCubit>();

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return BlocProvider(
      create: (context) => cartCubit,
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                      itemCount: product.images.length,
                      itemBuilder: (_, index, __) {
                        return CachedNetworkImage(
                          // width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                          imageUrl: product.images[index],
                          placeholder: (context, url) => Lottie.asset(
                              'assets/animations/Animation - 1729762541217.json'),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        );
                      },
                      options: CarouselOptions(
                          aspectRatio: 16 / 10,
                          autoPlay: true,
                          viewportFraction: 1.1)),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Text(
                      maxLines: 2,
                      product.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyTheme.mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "EGP ${product.price}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color.fromARGB(255, 0, 130, 26),
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp),
                    ),
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
                        "${product.sold} Sold",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
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
                        "${product.ratingsAverage} (${product.ratingsQuantity})",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: MyTheme.mainColor, fontSize: 14.sp),
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
                product.description,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show More",
                trimExpandedText: ".....Show Less",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: MyTheme.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
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
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 18.sp,
                                ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "EGP ${product.price}",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: MyTheme.mainColor,
                                  fontSize: 18.sp,
                                ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      cartCubit.addToCart(product.id);
                    },
                    child: Container(
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
                              onPressed: () {
                                cartCubit.addToCart(product.id);
                              },
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
