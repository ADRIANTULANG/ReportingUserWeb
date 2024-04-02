import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:responderuserweb/src/chat_screen/views/chat_main_page.dart';
import 'package:responderuserweb/src/dashboard_screen/view/dashboard_main_view.dart';
import 'package:responderuserweb/src/firstaid_screen/view/firstaid_main_view.dart';
import 'package:responderuserweb/src/history_screen/view/history_main_view.dart';
import 'package:responderuserweb/src/login_screen/views/login_page.dart';
import 'package:responderuserweb/src/tracking_screen/view/tracking_main_view.dart';
import 'package:responderuserweb/src/weather_screen/view/weather_main_view.dart';
import 'package:sizer/sizer.dart';
import '../../../../disaster_screen/view/disaster_main_view.dart';
import '../../../../report_details_screen/views/report_details_main_page.dart';
import '../../../controller/sidebar_wrapper_controller.dart';

class SidebarLandscapePage extends GetView<SideBarController> {
  const SidebarLandscapePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SideBarController());
    return Scaffold(
      body: Row(
        children: [
          // Sidebar widget
          Obx(
            () => Sidebar(
              currentRoute: controller.currentRoute.value,
              onRouteSelected: (String route) {
                // Update the current route when a sidebar button is clicked
                controller.navigateTo(route);
              },
            ),
          ),
          // Main content area
          Expanded(
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
        ],
      ),
    );
  }
}

class Sidebar extends GetView<SideBarController> {
  final String currentRoute;
  final Function(String) onRouteSelected;

  const Sidebar(
      {super.key, required this.currentRoute, required this.onRouteSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 160, 206, 228),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(5, 0), // Controls the spread direction (right side)
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 30.h,
              width: 100.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"))),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: SidebarButton(
                icon: Icon(
                  Icons.home,
                  color: currentRoute == DashboardMainPage.id
                      ? Colors.white
                      : Colors.lightBlue,
                ),
                label: 'Dashboard',
                route: DashboardMainPage.id,
                isSelected: currentRoute == DashboardMainPage.id,
                onPressed: onRouteSelected,
              ),
            ),
            //

            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: SidebarButton(
                icon: Icon(
                  Icons.history,
                  color: currentRoute == HistoryMainPage.id
                      ? Colors.white
                      : Colors.lightBlue,
                ),
                label: 'History Report',
                route: HistoryMainPage.id,
                isSelected: currentRoute == HistoryMainPage.id,
                onPressed: onRouteSelected,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: SidebarButton(
                icon: Icon(
                  Icons.sunny,
                  color: currentRoute == WeatherMainPage.id
                      ? Colors.white
                      : Colors.lightBlue,
                ),
                label: 'Weather Alerts',
                route: WeatherMainPage.id,
                isSelected: currentRoute == WeatherMainPage.id,
                onPressed: onRouteSelected,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: SidebarButton(
                icon: Icon(
                  Icons.warning,
                  color: currentRoute == DisasterMainPage.id
                      ? Colors.white
                      : Colors.lightBlue,
                ),
                label: 'Disaster Coping Tips',
                route: DisasterMainPage.id,
                isSelected: currentRoute == DisasterMainPage.id,
                onPressed: onRouteSelected,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: SidebarButton(
                icon: Icon(
                  Icons.location_on,
                  color: currentRoute == TrackingMainPage.id
                      ? Colors.white
                      : Colors.lightBlue,
                ),
                label: 'Tracking Report',
                route: TrackingMainPage.id,
                isSelected: currentRoute == TrackingMainPage.id,
                onPressed: onRouteSelected,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: SidebarButton(
                icon: Icon(
                  Icons.medical_information,
                  color: currentRoute == FirstaidMainPage.id
                      ? Colors.white
                      : Colors.lightBlue,
                ),
                label: 'Learn First Aid',
                route: FirstaidMainPage.id,
                isSelected: currentRoute == FirstaidMainPage.id,
                onPressed: onRouteSelected,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              width: 100.w,
              height: 5.h,
              child: SidebarButton(
                icon: const Icon(
                  Icons.logout,
                ),
                label: 'Logout',
                route: "",
                isSelected: false,
                onPressed: (string) {
                  Get.find<StorageServices>().removeStorageCredentials();
                  Get.offAllNamed(LoginMainPage.id);
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            // Add more buttons or links for other screens
          ],
        ),
      ),
    );
  }
}

class SidebarButton extends GetView<SideBarController> {
  final String label;
  final String route;
  final Icon icon;

  final bool isSelected;
  final Function(String) onPressed;

  const SidebarButton({
    super.key,
    required this.label,
    required this.route,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(route),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(12),
        backgroundColor: MaterialStateProperty.all(
          isSelected ? Colors.lightBlue : Colors.white,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 1.w,
          ),
          icon,
          SizedBox(
            width: 2.w,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
