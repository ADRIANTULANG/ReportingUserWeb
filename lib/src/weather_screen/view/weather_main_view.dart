import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:responderuserweb/src/weather_screen/controller/weather_controller.dart';

import 'landscape/view/weather_landscape_view.dart';
import 'portrait/view/weather_portrait_view.dart';

class WeatherMainPage extends GetView<WeatherController> {
  const WeatherMainPage({super.key});
  static const String id = "weather";

  @override
  Widget build(BuildContext context) {
    return Obx(() => Get.find<ScreenServices>().orientation.value == "landscape"
        ? const WeatherLandscapePage()
        : const WeatherPortraitPage());
  }
}
