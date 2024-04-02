import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:responderuserweb/src/dashboard_screen/view/landscape/view/dashboard_landscape_view.dart';
import 'package:responderuserweb/src/dashboard_screen/view/portrait/view/dashboard_portrait_view.dart';

import '../controller/dashboard_controller.dart';

class DashboardMainPage extends GetView<DashboardController> {
  const DashboardMainPage({super.key});
  static const String id = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const DashboardLandscapePage()
        : const DashboardPortraitPage());
  }
}
