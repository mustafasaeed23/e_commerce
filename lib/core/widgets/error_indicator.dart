import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  final String message;
  // ignore: use_key_in_widget_constructors
  const ErrorIndicator([this.message = 'Something went Wrong']);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
