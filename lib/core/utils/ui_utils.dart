import 'package:e_commerce/core/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showLoading(BuildContext context) => showDialog(
      context: context,
      builder: (_) => PopScope(
          canPop: false,
          child: AlertDialog(
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingIndicator(),
                ],
              ),
            ),
          )));

  static void hideLoading(BuildContext context) => Navigator.pop(context);

  static void showMessage(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }
}
