import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:responderuserweb/src/sidebar_wrapper_screen/controller/sidebar_wrapper_controller.dart';

import 'landscape/view/sidebar_landscape_view.dart';
import 'portrait/view/sidebar_wrapper_portrait_view.dart';

class SideBarPage extends GetView<SideBarController> {
  const SideBarPage({super.key});
  static const String id = "wrapper";
  @override
  Widget build(BuildContext context) {
    Get.put(SideBarController());
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const SidebarLandscapePage()
        : const SideBarPortraitPage());
  }
}
