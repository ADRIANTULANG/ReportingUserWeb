import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import '../controller/tracking_controller.dart';
import 'landscape/view/tracking_landscape_view.dart';
import 'portrait/view/tracking_portrait_view.dart';

class TrackingMainPage extends GetView<TrackingController> {
  const TrackingMainPage({super.key});
  static const String id = "tracking";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const TrackingLandscapePage()
        : const TrackingPortraitPage());
  }
}
