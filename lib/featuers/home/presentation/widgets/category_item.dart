import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/featuers/home/Domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.r,
              child: Image.network(category.image ?? "assets/images/proucts2.png")
              // Image.asset("assets/images/proucts2.png")
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
            ))
      ],
    );
  }
}
