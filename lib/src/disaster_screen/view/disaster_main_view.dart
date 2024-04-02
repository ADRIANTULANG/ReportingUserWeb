import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:responderuserweb/src/Disaster_screen/controller/Disaster_controller.dart';

import 'landscape/view/disaster_landscape_view.dart';
import 'portrait/view/disaster_portrait_view.dart';

class DisasterMainPage extends GetView<DisasterController> {
  const DisasterMainPage({super.key});
  static const String id = "disaster";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const DisasterLandscapePage()
        : const DisasterPortraitPage());
  }
}
