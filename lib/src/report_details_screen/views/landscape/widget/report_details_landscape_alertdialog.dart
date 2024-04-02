import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/report_details_screen/controller/report_details_controller.dart';
import 'package:sizer/sizer.dart';

class ReportDetailsLandscapeAlertDialog {
  static showDialogAddRemarks({required String message}) {
    var controller = Get.find<ReportDetailsController>();
    TextEditingController remarks = TextEditingController();
    remarks.text = message;
    Get.dialog(AlertDialog(
      title: Text(
        "Remarks",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 5.sp),
      ),
      content: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 30.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all()),
                child: TextField(
                  maxLines: 5,
                  controller: remarks,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 1.h, left: .5.w),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 6.h,
                width: 60.w,
                child: ElevatedButton(
                    onPressed: () {
                      if (remarks.text.isNotEmpty) {
                        Get.back();
                        controller.updateRemarks(message: remarks.text);
                        // Navigator.pop(context);
                        // updateRemarks(message: remarks.text);
                      }
                    },
                    child: const Text("ADD")),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
