import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/cart/Domain/Entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem(this.cartItemEntity, {super.key});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: MyTheme.mainColor.withOpacity(0.5))),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: CachedNetworkImage(
              width: 120.w,
              fit: BoxFit.fill,
              imageUrl: cartItemEntity.product.imageCover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            //     Image.asset(
            //   "assets/images/product_cart.png",
            //   width: 120.w,
            //   height: double.infinity.h,
            //   fit: BoxFit.fill,
            // ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cartItemEntity.product.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.mainColor, fontSize: 17.sp),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/delete.png")),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "EGP ${cartItemEntity.price}",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.mainColor, fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      height: 40.h,
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
                            "${cartItemEntity.count}",
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
