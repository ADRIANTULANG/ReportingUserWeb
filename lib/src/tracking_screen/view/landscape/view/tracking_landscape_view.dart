import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:responderuserweb/src/report_details_screen/controller/report_details_controller.dart';
import 'package:responderuserweb/src/report_details_screen/views/report_details_main_page.dart';
import 'package:responderuserweb/src/sidebar_wrapper_screen/controller/sidebar_wrapper_controller.dart';
import 'package:sizer/sizer.dart';
import '../../../../../model/report_model.dart';
import '../../../controller/tracking_controller.dart';

class TrackingLandscapePage extends GetView<TrackingController> {
  const TrackingLandscapePage({super.key});

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
                    "Tracking",
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
                    width: 60.w,
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
                  SizedBox(
                    width: 1.w,
                  ),
                  SizedBox(
                    height: 7.h,
                    width: 5.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.lightBlue,
                        ),
                      ),
                      onPressed: () {
                        controller.getReports();
                      },
                      child: const Icon(Icons.refresh_rounded),
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
                  itemCount: controller.trackingReport.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: index.isOdd ? Colors.white : Colors.grey[300],
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 2.h, left: 1.5.w, right: 1.5.w, bottom: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      controller.trackingReport[index].type,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 5.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      "(${controller.trackingReport[index].status})",
                                      style: TextStyle(
                                        color: controller.trackingReport[index]
                                                    .status ==
                                                "Pending"
                                            ? Colors.orange
                                            : Colors.blue,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 3.5.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${DateFormat.yMMMMd().format(controller.trackingReport[index].dateTime)} ${DateFormat.jm().format(controller.trackingReport[index].dateTime)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2.5.sp,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      if (Get.find<ReportDetailsController>()
                                              .locationListener !=
                                          null) {
                                        Get.find<ReportDetailsController>()
                                            .locationListener!
                                            .cancel();
                                      }
                                      Map<String, dynamic> mdoelString =
                                          controller.trackingReport[index]
                                              .toJson();
                                      var stringModel = jsonEncode(mdoelString);
                                      await Get.find<StorageServices>()
                                          .saveModel(model: stringModel);
                                      var dataReportString =
                                          Get.find<StorageServices>()
                                              .storage
                                              .read('report');
                                      var modelReport =
                                          jsonDecode(dataReportString);
                                      Get.find<ReportDetailsController>().reportDetails = Report(
                                          responderRemarks:
                                              modelReport['responderRemarks'],
                                          level: modelReport['level'],
                                          dateTime: DateTime.now(),
                                          address:
                                              modelReport['address'].toString(),
                                          contactnumber:
                                              modelReport['contactnumber']
                                                  .toString(),
                                          year: int.parse(
                                              modelReport['year'].toString()),
                                          responder: modelReport['responder']
                                              .toString(),
                                          caption:
                                              modelReport['caption'].toString(),
                                          type: modelReport['type'].toString(),
                                          remarks: modelReport['remarks'] ?? "",
                                          userId:
                                              modelReport['userId'].toString(),
                                          long: double.parse(
                                              modelReport['long'].toString()),
                                          month: int.parse(
                                              modelReport['month'].toString()),
                                          imageUrl:
                                              modelReport['imageURL'] ?? "",
                                          name: modelReport['name'] ?? "",
                                          day: int.parse(
                                              modelReport['day'].toString()),
                                          lat: double.parse(
                                              modelReport['lat'].toString()),
                                          status:
                                              modelReport['status'].toString(),
                                          documentId: modelReport['documentID']
                                              .toString());

                                      await Get.find<ReportDetailsController>()
                                          .initializedData();
                                      Get.find<ReportDetailsController>()
                                          .hasImage
                                          .value = Get.find<
                                                      ReportDetailsController>()
                                                  .reportDetails!
                                                  .imageUrl
                                                  .isEmpty ||
                                              Get.find<ReportDetailsController>()
                                                      .reportDetails!
                                                      .imageUrl ==
                                                  "null"
                                          ? false
                                          : true;
                                      Get.find<ReportDetailsController>()
                                              .remarksText
                                              .value =
                                          Get.find<ReportDetailsController>()
                                              .reportDetails!
                                              .remarks;
                                      Get.find<SideBarController>()
                                          .currentRoute
                                          .value = ReportDetailsMainPage.id;
                                      // Get.toNamed(
                                      //   ReportDetailsMainPage.id,
                                      // );
                                    },
                                    icon: const Icon(
                                      Icons.location_on,
                                      color: Colors.lightBlue,
                                    )),
                                SizedBox(
                                  width: 2.w,
                                ),
                              ],
                            )
                          ],
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
    ));
  }
}
