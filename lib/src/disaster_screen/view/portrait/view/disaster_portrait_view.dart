import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/disaster_screen/view/portrait/widget/disaster_portrait_alertdialog.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/disaster_controller.dart';

class DisasterPortraitPage extends GetView<DisasterController> {
  const DisasterPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
                child: Row(
                  children: [
                    Text(
                      "Disasters",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    SizedBox(
                      height: 7.h,
                      width: 75.w,
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
                    itemCount: controller.disasterData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 2.h, left: 1.5.w, right: 1.5.w, bottom: 2.h),
                          child: InkWell(
                            onTap: () {
                              DisasterCopingPortraitAlertDialog.showTips(
                                  image: controller.disasterData[index].images);
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                      width: 15.w,
                                      child: Image.asset(controller
                                          .disasterData[index].buttonimage),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .disasterData[index].disastername,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
