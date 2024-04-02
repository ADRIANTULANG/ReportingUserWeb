import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/src/register_screen/controller/register_controller.dart';
import 'package:sizer/sizer.dart';

import '../widget/register_body.dart';
import '../widget/register_footer.dart';
import '../widget/register_header.dart';

class RegisterLandscapePage extends GetView<RegisterController> {
  const RegisterLandscapePage({super.key});

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
              RegisterHeaderView(),
              Divider(color: Color(0xFFE0E0E0)),
              Expanded(child: RegisterBodyView()),
              RegisterFooterView()
            ],
          ),
        ),
      ),
    );
  }
}
