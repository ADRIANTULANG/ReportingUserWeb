import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/location_services.dart';
import 'package:responderuserweb/services/screen_services.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:responderuserweb/src/chat_screen/views/chat_main_page.dart';
import 'package:responderuserweb/src/register_screen/views/register_main_page.dart';
import 'package:sizer/sizer.dart';
import 'src/dashboard_screen/view/dashboard_main_view.dart';
import 'src/disaster_screen/view/disaster_main_view.dart';
import 'src/firstaid_screen/view/firstaid_main_view.dart';
import 'src/login_screen/views/login_page.dart';
import 'src/history_screen/view/history_main_view.dart';
import 'src/report_details_screen/views/report_details_main_page.dart';
import 'src/sidebar_wrapper_screen/views/sidebar_wrapper_main_view.dart';
import 'src/splash_screen/view/splash_view.dart';
import 'src/tracking_screen/view/tracking_main_view.dart';
import 'src/weather_screen/view/weather_main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA12fFunT5kbj2TmPZIBiSjImXsoPM3piQ",
          authDomain: "responder-67a90.firebaseapp.com",
          projectId: "responder-67a90",
          storageBucket: "responder-67a90.appspot.com",
          messagingSenderId: "697586667913",
          appId: "1:697586667913:web:becd9ba26ecc886782d158"));
  await Get.putAsync<ScreenServices>(() async => ScreenServices());
  await Get.putAsync<LocationServices>(() async => LocationServices());

  await Get.putAsync<StorageServices>(() async => StorageServices());

  // Get.put(StorageServices());
  // Get.put(NotificationServices());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      Get.find<ScreenServices>().orientation.value = orientation.name;
      log(orientation.name);
      log(deviceType.name);
      return GetMaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        debugShowCheckedModeBanner: false,
        title: 'RESPONDER',
        theme: ThemeData(
          fontFamily: "BariolNormal",
          primarySwatch: Colors.lightBlue,
        ),
        initialRoute: SplashPage.id,
        routes: {
          SplashPage.id: (context) => const SplashPage(),
          LoginMainPage.id: (context) => const LoginMainPage(),
          HistoryMainPage.id: (context) => const HistoryMainPage(),
          DashboardMainPage.id: (context) => const DashboardMainPage(),
          SideBarPage.id: (context) => const SideBarPage(),
          WeatherMainPage.id: (context) => const WeatherMainPage(),
          DisasterMainPage.id: (context) => const DisasterMainPage(),
          TrackingMainPage.id: (context) => const TrackingMainPage(),
          FirstaidMainPage.id: (context) => const FirstaidMainPage(),
          ReportDetailsMainPage.id: (context) => const ReportDetailsMainPage(),
          ChatMainPage.id: (context) => const ChatMainPage(),
          RegisterMainPage.id: (context) => const RegisterMainPage(),
        },
      );
    });
  }
}
