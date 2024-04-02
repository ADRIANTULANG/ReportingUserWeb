import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/register_screen/controller/register_controller.dart';
import 'package:sizer/sizer.dart';

class RegisterPortraitPage extends GetView<RegisterController> {
  const RegisterPortraitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Text(
              "Registration",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.5.sp,
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 8.sp),
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: SizedBox(
              height: 7.h,
              width: 100.w,
              child: TextField(
                controller: controller.name,
                onChanged: (value) {},
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 7.5.sp),
                onEditingComplete: () {
                  // controller.Register(
                  //     username: controller.username.text,
                  //     password: controller.password.text);
                },
                decoration: InputDecoration(
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: .5.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Text(
              "Contact no",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 8.sp),
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: SizedBox(
              height: 7.h,
              width: 100.w,
              child: TextField(
                controller: controller.contactno,
                onChanged: (value) {},
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 7.5.sp),
                onEditingComplete: () {
                  // controller.Register(
                  //     username: controller.username.text,
                  //     password: controller.password.text);
                },
                decoration: InputDecoration(
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: .5.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Text(
              "Address",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 8.sp),
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: SizedBox(
              height: 7.h,
              width: 100.w,
              child: TextField(
                controller: controller.address,
                onChanged: (value) {},
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 7.5.sp),
                onEditingComplete: () {
                  // controller.Register(
                  //     username: controller.username.text,
                  //     password: controller.password.text);
                },
                decoration: InputDecoration(
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: .5.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 8.sp),
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: SizedBox(
              height: 7.h,
              width: 100.w,
              child: TextField(
                controller: controller.email,
                onChanged: (value) {},
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 7.5.sp),
                onEditingComplete: () {
                  // controller.Register(
                  //     username: controller.username.text,
                  //     password: controller.password.text);
                },
                decoration: InputDecoration(
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: .5.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 8.sp),
            ),
          ),
          SizedBox(
            height: .5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: SizedBox(
              height: 7.h,
              width: 100.w,
              child: TextField(
                controller: controller.password,
                onChanged: (value) {},
                obscureText: true,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 7.5.sp),
                onEditingComplete: () {
                  // controller.Register(
                  //     username: controller.username.text,
                  //     password: controller.password.text);
                },
                decoration: InputDecoration(
                    fillColor: const Color(0xFFF0EEEE),
                    filled: true,
                    contentPadding: EdgeInsets.only(left: .5.w),
                    alignLabelWithHint: false,
                    border: InputBorder.none),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Front ID",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.getImageFront();
                      },
                      child: Obx(
                        () => Container(
                          height: 25.h,
                          width: 42.w,
                          decoration: controller.hasFrontImage.value
                              ? BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          MemoryImage(controller.imageFront!)))
                              : BoxDecoration(color: Colors.grey[200]),
                          child: controller.hasFrontImage.value
                              ? const SizedBox()
                              : const Center(
                                  child: Icon(Icons.image),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Back ID",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.getImageBack();
                      },
                      child: Obx(
                        () => Container(
                          height: 25.h,
                          width: 42.w,
                          decoration: controller.hasBackImage.value
                              ? BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          MemoryImage(controller.imageBack!)))
                              : BoxDecoration(color: Colors.grey[200]),
                          child: controller.hasBackImage.value
                              ? const SizedBox()
                              : const Center(
                                  child: Icon(Icons.image),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: InkWell(
              onTap: () {
                if (controller.name.text.isEmpty ||
                    controller.address.text.isEmpty ||
                    controller.email.text.isEmpty ||
                    controller.password.text.isEmpty ||
                    controller.hasBackImage.value == false ||
                    controller.hasFrontImage.value == false ||
                    controller.contactno.text.isEmpty) {
                  Get.snackbar("Message", "Missing input",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM);
                } else {
                  controller.createAccount();
                }
              },
              child: Container(
                height: 6.h,
                width: 100.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 8.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
        ],
      ),
    ));
  }
}
