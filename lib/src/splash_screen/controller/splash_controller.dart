import 'dart:async';

import 'package:get/get.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:responderuserweb/src/login_screen/views/login_page.dart';
import 'package:responderuserweb/src/sidebar_wrapper_screen/views/sidebar_wrapper_main_view.dart';

class SplashController extends GetxController {
  navigateTo() async {
    Timer(const Duration(seconds: 3), () {
      if (Get.find<StorageServices>().storage.read('id') == null) {
        Get.toNamed(LoginMainPage.id);
      } else {
        Get.toNamed(SideBarPage.id);
      }
    });
  }

  @override
  void onInit() {
    navigateTo();
    super.onInit();
  }
}
