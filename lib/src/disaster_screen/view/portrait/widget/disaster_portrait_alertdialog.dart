import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DisasterCopingPortraitAlertDialog {
  static showTips({required String image}) async {
    Get.dialog(AlertDialog(
      content: Container(
        height: 100.h,
        width: 100.w,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image))),
      ),
    ));
  }
}
