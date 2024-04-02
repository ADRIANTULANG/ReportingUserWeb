import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DisasterCopingLandscapeAlertDialog {
  static showTips({required String image}) async {
    Get.dialog(AlertDialog(
      content: Container(
        height: 80.h,
        width: 30.w,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image))),
      ),
    ));
  }
}
