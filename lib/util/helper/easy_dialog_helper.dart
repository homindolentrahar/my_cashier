import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class EasyDialogHelper {
  static void showLoading() {
    EasyLoading.show(
      indicator: CircularProgressIndicator(
        color: Get.theme.primaryColor,
        backgroundColor: Colors.transparent,
      ),
      maskType: EasyLoadingMaskType.none,
    );
  }

  static void showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  static void showError(String error) {
    EasyLoading.showError(error);
  }

  static void hideDialog() {
    EasyLoading.dismiss();
  }
}
