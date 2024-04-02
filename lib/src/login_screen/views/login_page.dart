import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';

import '../controller/login_controller.dart';
import 'landscape/view/login_landscape_view.dart';
import 'portrait/view/login_portait_view.dart';

class LoginMainPage extends GetView<LoginController> {
  const LoginMainPage({super.key});
  static const String id = "login";
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const LoginLandscapePage()
        : const LoginPortraitPage());
  }
}
