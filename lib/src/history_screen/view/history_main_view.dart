import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:responderuserweb/src/history_screen/view/landscape/view/history_landscape_view.dart';
import 'package:responderuserweb/src/history_screen/view/portrait/view/history_portrait_view.dart';
import '../controller/history_controller.dart';

class HistoryMainPage extends GetView<HistoryController> {
  const HistoryMainPage({super.key});
  static const String id = "history";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const HistoryLandscapePage()
        : const HistoryPortraitPage());
  }
}
