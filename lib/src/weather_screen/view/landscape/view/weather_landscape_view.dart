import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/weather_controller.dart';

class WeatherLandscapePage extends GetView<WeatherController> {
  const WeatherLandscapePage({super.key});

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
              Container(
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
                      Icons.info_outline,
                      size: 15.sp,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(() => Text(
                          "Description: ${controller.weatherDescription.value.capitalizeFirst.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 4.sp),
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
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
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(() => Text(
                          "Temperature: ${controller.temperatureCelsius.value.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 4.sp),
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
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
                      Icons.compare_arrows,
                      size: 15.sp,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(() => Text(
                          "Pressure: ${controller.pressure.value.toStringAsFixed(2)} hPa",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 4.sp),
                        ))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.5.h,
          ),
          Row(
            children: [
              Container(
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
                      Icons.heat_pump,
                      size: 15.sp,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(() => Text(
                          "Humidity: ${controller.humidity.value.toStringAsFixed(2)}%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 4.sp),
                        ))
                  ],
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Container(
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
                      Icons.wind_power,
                      size: 15.sp,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(() => Text(
                          "Wind Speed: ${controller.windSpeed.value.toStringAsFixed(2)} m/s",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 4.sp),
                        ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
