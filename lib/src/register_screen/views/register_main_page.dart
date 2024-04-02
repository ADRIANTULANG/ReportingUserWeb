import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/register_screen/controller/register_controller.dart';
import 'package:responderuserweb/src/register_screen/views/landscape/view/register_landscape_view.dart';
import 'package:responderuserweb/src/register_screen/views/portrait/view/register_portrait_view.dart';

import '../../../services/screen_services.dart';

class RegisterMainPage extends GetView<RegisterController> {
  const RegisterMainPage({super.key});
  static const String id = "register";

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const RegisterLandscapePage()
        : const RegisterPortraitPage());
  }
}
