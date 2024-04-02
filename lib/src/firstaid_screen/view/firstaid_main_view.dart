import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:responderuserweb/src/Firstaid_screen/controller/Firstaid_controller.dart';
import 'landscape/view/firstaid_landscape_view.dart';
import 'portrait/view/firstaid_portrait_view.dart';

class FirstaidMainPage extends GetView<FirstaidController> {
  const FirstaidMainPage({super.key});
  static const String id = "firstaid";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const FirstaidLandscapePage()
        : const FirstaidPortraitPage());
  }
}
