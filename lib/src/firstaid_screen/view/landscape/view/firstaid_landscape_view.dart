import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/firstaid_controller.dart';

class FirstaidLandscapePage extends GetView<FirstaidController> {
  const FirstaidLandscapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
            child: Row(
              children: [
                Text(
                  "Firstaid",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 7.sp,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  height: 7.h,
                  width: 62.w,
                  child: TextField(
                    onChanged: (value) {
                      if (controller.debounce?.isActive ?? false) {
                        controller.debounce?.cancel();
                      }
                      controller.debounce =
                          Timer(const Duration(milliseconds: 1000), () {
                        controller.searchFunction(word: value);
                      });
                    },
                    onEditingComplete: () {
                      // controller.login(
                      //     username: controller.username.text,
                      //     password: controller.password.text);
                    },
                    controller: controller.search,
                    decoration: InputDecoration(
                        hintText: "Search",
                        fillColor: Colors.grey[200],
                        filled: true,
                        contentPadding: EdgeInsets.only(left: .5.w),
                        alignLabelWithHint: false,
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.firstAidData.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, left: 1.5.w, right: 1.5.w, bottom: 2.h),
                      child: InkWell(
                        onTap: () {
                          controller.urlLauncher(
                              url: controller.firstAidData[index].link);
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                  width: 5.w,
                                  child: Image.asset(
                                      controller.firstAidData[index].image),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .firstAidData[index].firstaidname,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
