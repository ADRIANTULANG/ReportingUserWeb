import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sizer/sizer.dart';

class DashboardLandscapeAlertdialog {
  static createReport() {
    var controller = Get.find<DashboardController>();
    Get.dialog(AlertDialog(
      content: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Report Accident",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 4.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Report name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.sp),
            ),
            SizedBox(
              height: 7.h,
              width: 50.w,
              child: TextField(
                onChanged: (value) {},
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 3.sp),
                onEditingComplete: () {},
                controller: controller.name,
                decoration: InputDecoration(
                    hintText: "",
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: 1.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Contact no",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.sp),
            ),
            SizedBox(
              height: 7.h,
              width: 50.w,
              child: TextField(
                onChanged: (value) {},
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 3.sp),
                onEditingComplete: () {},
                controller: controller.contactnumber,
                decoration: InputDecoration(
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: 1.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.sp),
            ),
            Container(
              height: 7.h,
              width: 50.w,
              color: const Color(0xFFF0EEEE),
              child: Obx(
                () => DropdownButton<String>(
                  padding: EdgeInsets.only(left: 1.w, right: 1.w),
                  isExpanded: true,
                  value: controller.addressValue.value,
                  elevation: 16,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 3.sp),
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    controller.addressValue.value = value!;
                  },
                  items: controller.addressList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Accident type",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.sp),
            ),
            Container(
              height: 7.h,
              width: 50.w,
              color: const Color(0xFFF0EEEE),
              child: Obx(
                () => DropdownButton<String>(
                  padding: EdgeInsets.only(left: 1.w, right: 1.w),
                  isExpanded: true,
                  value: controller.accidentValue.value,
                  elevation: 16,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 3.sp),
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    controller.accidentValue.value = value!;
                  },
                  items: controller.accidentType
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.sp),
            ),
            SizedBox(
              height: 7.h,
              width: 50.w,
              child: TextField(
                onChanged: (value) {},
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 3.sp),
                onEditingComplete: () {},
                controller: controller.description,
                decoration: InputDecoration(
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: 1.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                controller.getImage();
              },
              child: Obx(
                () => Container(
                  height: 13.h,
                  width: 50.w,
                  decoration: controller.hasImage.value
                      ? BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: MemoryImage(controller.image!)))
                      : null,
                  child: controller.hasImage.value
                      ? const SizedBox()
                      : const Center(
                          child: Icon(Icons.image),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 7.h,
              width: 50.w,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.name.text.isEmpty ||
                      controller.contactnumber.text.isEmpty ||
                      controller.image == null ||
                      controller.description.text.isEmpty) {
                  } else {
                    controller.createReport();
                  }
                },
                child: Text(
                  "Create Report",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 3.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
