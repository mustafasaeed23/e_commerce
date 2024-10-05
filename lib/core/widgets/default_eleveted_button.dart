import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';

class DefaultElevetedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const DefaultElevetedButton(
      {super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: MyTheme.whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
      child: SizedBox(
        height: 54,
        width: 98,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: MyTheme.mainColor,
                  fontSize: 20,
                ),
          ),
        ),
      ),
    );
  }
}
