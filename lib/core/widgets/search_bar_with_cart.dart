import 'package:e_commerce/core/widgets/search_text_field.dart';
import 'package:e_commerce/featuers/cart/Presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWithCart extends StatelessWidget {
  const SearchBarWithCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SearchTextField()),
        SizedBox(
          width: 24.w,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          child: ImageIcon(
            const AssetImage(
              "assets/icons/cart.png",
            ),
            size: 28.sp,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
