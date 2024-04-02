import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/chat_screen/views/chat_main_page.dart';
import 'package:responderuserweb/src/disaster_screen/view/disaster_main_view.dart';
import 'package:responderuserweb/src/report_details_screen/views/report_details_main_page.dart';
import 'package:responderuserweb/src/weather_screen/view/weather_main_view.dart';
import 'package:sizer/sizer.dart';
import '../../../../../services/storage_services.dart';
import '../../../../dashboard_screen/view/dashboard_main_view.dart';
import '../../../../firstaid_screen/view/firstaid_main_view.dart';
import '../../../../history_screen/view/history_main_view.dart';
import '../../../../login_screen/views/login_page.dart';
import '../../../../tracking_screen/view/tracking_main_view.dart';
import '../../../controller/sidebar_wrapper_controller.dart';

class SideBarPortraitPage extends GetView<SideBarController> {
  const SideBarPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Responder')),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                  height: 15.h,
                  width: 100.w,
                  child: Image.asset("assets/images/logo.png")),
              SizedBox(
                height: 3.h,
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.lightBlue,
                ),
                title: const Text('Home'),
                onTap: () {
                  Get.back();
                  controller.currentRoute.value = DashboardMainPage.id;
                  controller.navigateTo(controller.currentRoute.value);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.history_sharp,
                  color: Colors.lightBlue,
                ),
                title: const Text('History Report'),
                onTap: () {
                  Get.back();
                  controller.currentRoute.value = HistoryMainPage.id;
                  controller.navigateTo(controller.currentRoute.value);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.sunny,
                  color: Colors.lightBlue,
                ),
                title: const Text('Weather Alerts'),
                onTap: () {
                  Get.back();
                  controller.currentRoute.value = WeatherMainPage.id;
                  controller.navigateTo(controller.currentRoute.value);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.warning,
                  color: Colors.lightBlue,
                ),
                title: const Text('Disaster Coping Tips'),
                onTap: () {
                  Get.back();
                  controller.currentRoute.value = DisasterMainPage.id;
                  controller.navigateTo(controller.currentRoute.value);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.location_pin,
                  color: Colors.lightBlue,
                ),
                title: const Text('Tracking Report'),
                onTap: () {
                  Get.back();
                  controller.currentRoute.value = TrackingMainPage.id;
                  controller.navigateTo(controller.currentRoute.value);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.medical_information,
                  color: Colors.lightBlue,
                ),
                title: const Text('Learn First Aid'),
                onTap: () {
                  Get.back();
                  controller.currentRoute.value = FirstaidMainPage.id;
                  controller.navigateTo(controller.currentRoute.value);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.lightBlue,
                ),
                title: const Text('Log out'),
                onTap: () async {
                  Get.find<StorageServices>().removeStorageCredentials();
                  Get.offAllNamed(LoginMainPage.id);
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            child: Obx(() {
              if (controller.currentRoute.value == DashboardMainPage.id) {
                return const DashboardMainPage();
              } else if (controller.currentRoute.value == HistoryMainPage.id) {
                return const HistoryMainPage();
              } else if (controller.currentRoute.value == WeatherMainPage.id) {
                return const WeatherMainPage();
              } else if (controller.currentRoute.value == DisasterMainPage.id) {
                return const DisasterMainPage();
              } else if (controller.currentRoute.value == TrackingMainPage.id) {
                return const TrackingMainPage();
              } else if (controller.currentRoute.value == FirstaidMainPage.id) {
                return const FirstaidMainPage();
              } else if (controller.currentRoute.value ==
                  ReportDetailsMainPage.id) {
                return const ReportDetailsMainPage();
              } else if (controller.currentRoute.value == ChatMainPage.id) {
                return const ChatMainPage();
              } else {
                return Container();
              }
            }),
          ),
        ));
  }
}
