import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/login_controller.dart';
import '../widget/login_body.dart';
import '../widget/login_footer.dart';
import '../widget/login_header.dart';

class LoginLandscapePage extends GetView<LoginController> {
  const LoginLandscapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: false,
      focusNode: FocusNode(),
      onKey: (event) {},
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: 100.h,
          width: 100.w,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginHeaderView(),
              Divider(color: Color(0xFFE0E0E0)),
              Expanded(child: LoginBodyView()),
              LoginFooterView()
            ],
          ),
        ),
      ),
    );
  }
}
