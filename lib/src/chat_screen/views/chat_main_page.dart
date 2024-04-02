import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/model/report_model.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:responderuserweb/src/chat_screen/views/landscape/view/chat_landscape_view.dart';
import 'package:responderuserweb/src/chat_screen/views/portrait/view/chat_portrait_view.dart';
import 'package:responderuserweb/src/report_details_screen/controller/report_details_controller.dart';
import '../../../services/screen_services.dart';
import '../controller/chat_controller.dart';

class ChatMainPage extends GetView<ChatController> {
  const ChatMainPage({super.key});
  static const String id = "chat";

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<ChatController>() == false) {
      Get.put(ChatController());
      Get.put(ReportDetailsController());
      if (Get.find<ChatController>().chatListener != null) {
        Get.find<ChatController>().chatListener!.cancel();
      }
      var dataReportString = Get.find<StorageServices>().storage.read('report');
      var modelReport = jsonDecode(dataReportString);
      Get.find<ReportDetailsController>().reportDetails = Report(
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
      Get.find<ChatController>().getChats();
    }
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const ChatLandscapePage()
        : const ChatPortraitPage());
  }
}
