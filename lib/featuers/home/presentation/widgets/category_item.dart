import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/home/Domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: category.image!,
              placeholder: (context, url) => Lottie.asset(
                  'assets/animations/Animation - 1729762541217.json'),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size: 30.sp,
                color: MyTheme.mainColor,
              ),
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 2,
            child: Text(
              category.name ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 14.sp,
                  color: MyTheme.mainColor,
                  fontWeight: FontWeight.normal),
            )),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
