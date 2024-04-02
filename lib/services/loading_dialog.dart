import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:sizer/sizer.dart';

class LoadingDialog {
  static showLoadingDialog() async {
    Get.dialog(
        AlertDialog(
          content: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: SpinKitThreeBounce(
                            size: 10.sp, color: Colors.lightBlue),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            "Loading...",
                            style: TextStyle(
                                fontSize: Get.find<ScreenServices>()
                                            .orientation
                                            .value ==
                                        "landscape"
                                    ? 3.sp
                                    : 11.sp,
                                color: Colors.black),
                          ))
                    ],
                  )),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
