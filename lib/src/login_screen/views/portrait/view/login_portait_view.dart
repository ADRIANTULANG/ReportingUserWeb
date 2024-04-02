import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../register_screen/views/register_main_page.dart';
import '../../../controller/login_controller.dart';

class LoginPortraitPage extends GetView<LoginController> {
  const LoginPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 7.h,
              ),
              Container(
                height: 35.h,
                width: 100.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/logo.png'))),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 7.h,
                width: 100.w,
                child: TextField(
                  controller: controller.username,
                  style: TextStyle(fontSize: 7.sp),
                  decoration: InputDecoration(
                      fillColor: Colors.lightBlue[100],
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 3.w),
                      alignLabelWithHint: false,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(fontSize: 7.sp, fontFamily: 'Bariol')),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 7.h,
                width: 100.w,
                child: TextField(
                  controller: controller.password,
                  style: TextStyle(fontSize: 7.sp),
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.lightBlue[100],
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 3.w),
                      alignLabelWithHint: false,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(fontSize: 7.sp, fontFamily: 'Bariol')),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: SizedBox(
                  width: 100.w,
                  height: 7.h,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.lightBlue),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(color: Colors.white)))),
                    onPressed: () {
                      if (controller.username.text.isEmpty ||
                          controller.password.text.isEmpty) {
                        Get.snackbar("Message", "Missing input",
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM);
                      } else {
                        controller.login();
                      }
                    },
                    child: Text("LOGIN",
                        style: TextStyle(fontSize: 8.sp, color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?",
                      style: TextStyle(fontSize: 6.sp)),
                  SizedBox(
                    width: 1.w,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(RegisterMainPage.id);
                    },
                    child: Text("Create account here.",
                        style: TextStyle(
                            fontSize: 6.sp,
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
