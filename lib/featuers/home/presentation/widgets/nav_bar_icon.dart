import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  final String imagePath;
  final bool isSelected;

  const NavBarIcon(
      {super.key, required this.imagePath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? MyTheme.whiteColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(4),
      child: ImageIcon(
        AssetImage(imagePath),
        color: isSelected ? Theme.of(context).primaryColor : MyTheme.whiteColor,
      ),
    );
  }
}
