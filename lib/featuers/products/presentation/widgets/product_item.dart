import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/cart/Presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/featuers/products/Domain/Entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatefulWidget {
  ProductItem(this.productEntity, {super.key});

  final ProductEntity productEntity;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final cartCubit = serviceLocator.get<CartCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cartCubit,
      child: Container(
        // height: 300.h,
        width: 210.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    height: 120.h,
                    width: 160.w,
                    fit: BoxFit.fitWidth,
                    imageUrl: widget.productEntity.coverImage,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  //  Image.asset(
                  //   productEntity.images.first ?? "assets/images/proucts2.png",
                  //   width: 191.w,
                  //   height: 150.h,
                  //   fit: BoxFit.fill,
                  // ),
                ),
                Positioned(
                    top: 5.h,
                    right: 5.w,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 17,
                      child: IconButton(
                          color: Theme.of(context).primaryColor,
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            size: 20.sp,
                          )),
                    )),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                widget.productEntity.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: MyTheme.mainColor,
                    ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "EGP ${widget.productEntity.price}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.mainColor,
                        ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                children: [
                  Text(
                    "Review ${widget.productEntity.ratingsAverage}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: MyTheme.mainColor,
                        ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  const ImageIcon(
                    AssetImage("assets/icons/star_.png"),
                    size: 16,
                    color: Colors.yellow,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      cartCubit.addToCart(widget.productEntity.id);
                    },
                    child: Icon(
                      Icons.add_circle,
                      size: 32.sp,
                      color: MyTheme.mainColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
