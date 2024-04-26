import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/dashboard_screen/controller/dashboard_controller.dart';
import 'package:responderuserweb/src/disaster_screen/view/disaster_main_view.dart';
import 'package:responderuserweb/src/firstaid_screen/view/firstaid_main_view.dart';
import 'package:responderuserweb/src/history_screen/view/history_main_view.dart';
import 'package:responderuserweb/src/tracking_screen/view/tracking_main_view.dart';
import 'package:responderuserweb/src/weather_screen/view/weather_main_view.dart';
import 'package:sizer/sizer.dart';

import '../widget/dashboard_landscape_alertdialog.dart';

class DashboardLandscapePage extends GetView<DashboardController> {
  const DashboardLandscapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 2.w, right: 2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Weather",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 7.sp,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.image = null;
                  controller.hasImage.value = false;
                  DashboardLandscapeAlertdialog.createReport();
                },
                child: Container(
                  height: 30.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/back.jpg"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_rounded,
                        size: 15.sp,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Report Accident",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 4.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                onTap: () {
                  controller.navigateToFeature(route: HistoryMainPage.id);
                },
                child: Container(
                  height: 30.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/back.jpg"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 15.sp,
                        color: Colors.lightBlue,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Report History",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 4.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                onTap: () {
                  controller.navigateToFeature(route: DisasterMainPage.id);
                },
                child: Container(
                  height: 30.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/back.jpg"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        size: 15.sp,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Disaster Coping Tips",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 4.sp),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.5.h,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  controller.navigateToFeature(route: FirstaidMainPage.id);
                },
                child: Container(
                  height: 30.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/back.jpg"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.medical_information,
                        size: 15.sp,
                        color: Colors.green,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Learn Firstaid",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 4.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                onTap: () {
                  controller.navigateToFeature(route: WeatherMainPage.id);
                },
                child: Container(
                  height: 30.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/back.jpg"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sunny,
                        size: 15.sp,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Weather Alerts",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 4.sp),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              InkWell(
                onTap: () {
                  controller.navigateToFeature(route: TrackingMainPage.id);
                },
                child: Container(
                  height: 30.h,
                  width: 23.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/back.jpg"))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 15.sp,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Report Tracking",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 4.sp),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
