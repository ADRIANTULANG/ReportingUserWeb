import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/register_controller.dart';

class RegisterBodyView extends GetView<RegisterController> {
  const RegisterBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Register here.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 3.5.sp,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                  borderRadius: BorderRadius.circular(3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 3.sp),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            SizedBox(
                              height: 7.h,
                              width: 22.w,
                              child: TextField(
                                controller: controller.name,
                                onChanged: (value) {},
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 3.sp),
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
                          ],
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contact no",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 3.sp),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            SizedBox(
                              height: 7.h,
                              width: 22.w,
                              child: TextField(
                                controller: controller.contactno,
                                onChanged: (value) {},
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 3.sp),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 3.sp),
                    ),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    height: 7.h,
                    width: 100.w,
                    child: TextField(
                      controller: controller.address,
                      onChanged: (value) {},
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 3.sp),
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
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 3.sp),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            SizedBox(
                              height: 7.h,
                              width: 22.w,
                              child: TextField(
                                controller: controller.email,
                                onChanged: (value) {},
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 3.sp),
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
                          ],
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 3.sp),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                            SizedBox(
                              height: 7.h,
                              width: 22.w,
                              child: TextField(
                                controller: controller.password,
                                onChanged: (value) {},
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 3.sp),
                                onEditingComplete: () {},
                                obscureText: true,
                                decoration: InputDecoration(
                                    fillColor: const Color(0xFFF0EEEE),
                                    filled: true,
                                    contentPadding: EdgeInsets.only(left: .5.w),
                                    alignLabelWithHint: false,
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Front ID",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 3.sp),
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
                                  height: 13.h,
                                  width: 22.w,
                                  decoration: controller.hasFrontImage.value
                                      ? BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: MemoryImage(
                                                  controller.imageFront!)))
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
                                  fontWeight: FontWeight.w400, fontSize: 3.sp),
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
                                  height: 13.h,
                                  width: 22.w,
                                  decoration: controller.hasBackImage.value
                                      ? BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: MemoryImage(
                                                  controller.imageBack!)))
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
                    padding: EdgeInsets.only(left: 2.w, right: 2.w),
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
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 3.sp,
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
            ),
          ),

          // Obx(() => controller.isRegisterView.value == true
          //     ? const RegisterView()
          //     : RegisterView()),
          // Expanded(
          //     child: Container(
          //   alignment: Alignment.center,
          //   child: Text(
          //     "Forgot your password?",
          //     style: TextStyle(
          //         fontWeight: FontWeight.w400,
          //         fontSize: 2.5.sp,
          //         color: Colors.lightGreen),
          //   ),
          // )),
        ],
      ),
    );
  }
}
