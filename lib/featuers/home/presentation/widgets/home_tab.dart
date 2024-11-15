import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:e_commerce/core/widgets/search_bar_with_cart.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/announcment_section.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/brands_section.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  static const String routeName = '/home_tab';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: SingleChildScrollView(
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
              AnnouncmentSection(),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyTheme.mainColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "view all",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: MyTheme.mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              const CategoriesSection(),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brands',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyTheme.mainColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "view all",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: MyTheme.mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                      ))
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              const BrandsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
