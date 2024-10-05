import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245.h,
      width: 200.w,
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
                child: Image.asset(
                  "assets/images/proucts2.png",
                  width: 191.w,
                  height: 128.h,
                  fit: BoxFit.fill,
                ),
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
              "Nike Air Jordon Nike shoes flexible for wo..",
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
                  "EGP 2999",
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
                  "Review (2.8)",
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
                  onTap: () {},
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
    );
  }
}
