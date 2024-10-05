import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.h),
          hintText: "What do you search for?",
          hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: Colors.grey),
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 28.sp,
                color: Theme.of(context).primaryColor.withOpacity(0.75),
              )),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          )),
    );
  }
}
