import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'color_constants.dart';

class ShowMessage{
  // final BuildContext context;
  // ShowMessage(this.context);

  static error({required BuildContext context, required String message}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorConstants.errorSnackBar,
        content: Text(
          message,
          style: const TextStyle(color: ColorConstants.errorSnackBarText),
        ),
        action: SnackBarAction(
          label: 'Try Again',
          textColor: ColorConstants.errorSnackBarText,
          onPressed: () {},
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static errorToast({required String message}){
    Fluttertoast.showToast(
        msg: message,
        toastLength:
        Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  static successToast({required String message}){
    Fluttertoast.showToast(
        msg: message,
        toastLength:
        Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }

}