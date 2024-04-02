import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/register_controller.dart';

class RegisterHeaderView extends GetView<RegisterController> {
  const RegisterHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        SizedBox(
          height: 7.h,
          width: 100.w,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 1.w, top: 1.h),
              height: 7.h,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Image.asset("assets/images/logo.png"),
                  SizedBox(
                    width: .5.w,
                  ),
                  Text(
                    "  RESPONDER ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 3.sp,
                        color: Colors.lightBlue[200]),
                  ),
                ],
              ),
            )),
          ]),
        ),
      ]),
    );
  }
}
