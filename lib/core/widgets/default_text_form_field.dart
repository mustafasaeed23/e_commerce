import 'package:e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;
  final int? maxLength;

  const DefaultTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.maxLength,
    this.suffixIcon,
    this.validator,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: MyTheme.whiteColor,
          filled: true,
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () => setState(() => isObscure != isObscure),
                  icon: isObscure
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.blueGrey,
              )),
      style: const TextStyle(
        color: MyTheme.blackColor,
      ),
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? isObscure : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
    );
  }
}
