import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/dashboard_screen/controller/dashboard_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../../disaster_screen/view/disaster_main_view.dart';
import '../../../../firstaid_screen/view/firstaid_main_view.dart';
import '../../../../history_screen/view/history_main_view.dart';
import '../../../../tracking_screen/view/tracking_main_view.dart';
import '../../../../weather_screen/view/weather_main_view.dart';
import '../widget/dashboard_portrait_alertdialog.dart';

class DashboardPortraitPage extends GetView<DashboardController> {
  const DashboardPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: SingleChildScrollView(
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
                fontSize: 13.sp,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                controller.image = null;
                controller.hasImage.value = false;
                DashboardPortraitAlertdialog.createReport();
              },
              child: Container(
                height: 30.h,
                width: 100.w,
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
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Report Accident",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.w,
            ),
            InkWell(
              onTap: () {
                controller.navigateToFeature(route: HistoryMainPage.id);
              },
              child: Container(
                height: 30.h,
                width: 100.w,
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
                      size: 25.sp,
                      color: Colors.lightBlue,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Report History",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.w,
            ),
            InkWell(
              onTap: () {
                controller.navigateToFeature(route: DisasterMainPage.id);
              },
              child: Container(
                height: 30.h,
                width: 100.w,
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
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Disaster Coping Tips",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                controller.navigateToFeature(route: FirstaidMainPage.id);
              },
              child: Container(
                height: 30.h,
                width: 100.w,
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
                      size: 25.sp,
                      color: Colors.green,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Learn Firstaid",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.w,
            ),
            InkWell(
              onTap: () {
                controller.navigateToFeature(route: WeatherMainPage.id);
              },
              child: Container(
                height: 30.h,
                width: 100.w,
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
                      size: 25.sp,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Weather Alerts",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.w,
            ),
            InkWell(
              onTap: () {
                controller.navigateToFeature(route: TrackingMainPage.id);
              },
              child: Container(
                height: 30.h,
                width: 100.w,
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
                      size: 25.sp,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Report Tracking",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
