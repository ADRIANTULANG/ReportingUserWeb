import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/weather_controller.dart';

class WeatherPortraitPage extends GetView<WeatherController> {
  const WeatherPortraitPage({super.key});

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
            Container(
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
                    Icons.info_outline,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => Text(
                        "Description: ${controller.weatherDescription.value.capitalizeFirst.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
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
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => Text(
                        "Temperature: ${controller.temperatureCelsius.value.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
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
                    Icons.compare_arrows,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => Text(
                        "Pressure: ${controller.pressure.value.toStringAsFixed(2)} hPa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
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
                    Icons.heat_pump,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => Text(
                        "Humidity: ${controller.humidity.value.toStringAsFixed(2)}%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
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
                    Icons.wind_power,
                    size: 25.sp,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Obx(() => Text(
                        "Wind Speed: ${controller.windSpeed.value.toStringAsFixed(2)} m/s",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11.sp),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
