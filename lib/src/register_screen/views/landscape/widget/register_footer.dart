import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/register_controller.dart';

class RegisterFooterView extends GetView<RegisterController> {
  const RegisterFooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 100.w,
      color: Colors.lightBlue[200],
    );
  }
}
