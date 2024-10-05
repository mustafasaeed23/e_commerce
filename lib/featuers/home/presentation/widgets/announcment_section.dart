// ignore_for_file: unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncmentSection extends StatelessWidget {
  AnnouncmentSection({super.key});

  final _carsouelImagesPaths = [
    "assets/icons/ad.png",
    "assets/icons/banner 2.png",
    "assets/icons/banner 3.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: _carsouelImagesPaths.length,
          itemBuilder: (_, index, __) => Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  _carsouelImagesPaths[index],
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
          options: CarouselOptions(autoPlay: true, viewportFraction: 1)),
    );
  }
}
