import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responderuserweb/model/report_model.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:responderuserweb/src/history_screen/controller/history_controller.dart';
import 'package:responderuserweb/src/report_details_screen/views/report_details_main_page.dart';
import 'package:sizer/sizer.dart';

import '../../../../report_details_screen/controller/report_details_controller.dart';
import '../../../../sidebar_wrapper_screen/controller/sidebar_wrapper_controller.dart';

class HistoryLandscapePage extends GetView<HistoryController> {
  const HistoryLandscapePage({super.key});

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
                    "History",
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
                    width: 61.w,
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
                      onEditingComplete: () {},
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
                        controller.getHistory();
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
                  itemCount: controller.historyReport.length,
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
                                Text(
                                  controller.historyReport[index].type,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 5.sp,
                                  ),
                                ),
                                Text(
                                  "${DateFormat.yMMMMd().format(controller.historyReport[index].dateTime)} ${DateFormat.jm().format(controller.historyReport[index].dateTime)}",
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
                                          controller.historyReport[index]
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
