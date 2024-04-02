import 'package:get/get.dart';
import 'package:responderuserweb/src/dashboard_screen/controller/dashboard_controller.dart';
import 'package:responderuserweb/src/dashboard_screen/view/dashboard_main_view.dart';

import '../../../services/storage_services.dart';
import '../../chat_screen/controller/chat_controller.dart';
import '../../disaster_screen/controller/disaster_controller.dart';
import '../../firstaid_screen/controller/firstaid_controller.dart';
import '../../history_screen/controller/history_controller.dart';
import '../../report_details_screen/controller/report_details_controller.dart';
import '../../tracking_screen/controller/tracking_controller.dart';
import '../../weather_screen/controller/weather_controller.dart';

class SideBarController extends GetxController {
  RxString currentRoute =
      Get.find<StorageServices>().storage.read('screen') == null
          ? DashboardMainPage.id.obs
          : Get.find<StorageServices>().storage.read('screen').toString().obs;

  void navigateTo(String route) {
    currentRoute.value = route;
    Get.find<StorageServices>().saveRoute(screen: currentRoute.value);
  }

  initializedControllers() async {
    Get.put(DashboardController());
    Get.put(HistoryController());
    Get.put(TrackingController());
    Get.put(DisasterController());
    Get.put(WeatherController());
    Get.put(FirstaidController());
    Get.put(ReportDetailsController());
    Get.put(ChatController());
  }

  @override
  void onInit() async {
    await initializedControllers();
    super.onInit();
  }
}
