import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/model/report_model.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:responderuserweb/src/chat_screen/controller/chat_controller.dart';
import 'package:responderuserweb/src/report_details_screen/controller/report_details_controller.dart';
import 'package:responderuserweb/src/report_details_screen/views/landscape/view/report_details_landscape_view.dart';
import 'package:responderuserweb/src/report_details_screen/views/portrait/view/report_details_portrait_view.dart';

import '../../../services/screen_services.dart';

class ReportDetailsMainPage extends GetView<ReportDetailsController> {
  const ReportDetailsMainPage({super.key});
  static const String id = "reportdetails";

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<ReportDetailsController>() == false) {
      Get.put(ReportDetailsController());
      Get.put(ChatController());
      if (controller.reportDetails == null) {
        if (controller.locationListener != null) {
          controller.locationListener!.cancel();
        }

        var dataReportString =
            Get.find<StorageServices>().storage.read('report');
        var modelReport = jsonDecode(dataReportString);
        controller.reportDetails = Report(
            responderRemarks: modelReport['responderRemarks'],
            level: modelReport['level'],
            dateTime: DateTime.now(),
            address: modelReport['address'].toString(),
            contactnumber: modelReport['contactnumber'].toString(),
            year: int.parse(modelReport['year'].toString()),
            responder: modelReport['responder'].toString(),
            caption: modelReport['caption'].toString(),
            type: modelReport['type'].toString(),
            remarks: modelReport['remarks'] ?? "",
            userId: modelReport['userId'].toString(),
            long: double.parse(modelReport['long'].toString()),
            month: int.parse(modelReport['month'].toString()),
            imageUrl: modelReport['imageURL'] ?? "",
            name: modelReport['name'] ?? "",
            day: int.parse(modelReport['day'].toString()),
            lat: double.parse(modelReport['lat'].toString()),
            status: modelReport['status'].toString(),
            documentId: modelReport['documentID'].toString());
        controller.initializedData();
        controller.hasImage.value =
            controller.reportDetails!.imageUrl.isEmpty ||
                    controller.reportDetails!.imageUrl == "null"
                ? false
                : true;
        controller.remarksText.value = controller.reportDetails!.remarks;
      }
    }

    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const ReportDetailsLandscapePage()
        : const ReportDetailsPortraitPage());
  }
}
