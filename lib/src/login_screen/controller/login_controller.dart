import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/services/loading_dialog.dart';
import 'package:responderuserweb/services/storage_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../sidebar_wrapper_screen/views/sidebar_wrapper_main_view.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isAllowed = false.obs;
  String facebookUrl = 'https://www.facebook.com/leopard.so.9?mibextid=ZbWKwL';
  RxBool isStudent = true.obs;

  login() async {
    try {
      LoadingDialog.showLoadingDialog();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username.text, password: password.text);
      var res = await FirebaseFirestore.instance
          .collection('Users')
          .where("email", isEqualTo: username.text)
          .where("type", isEqualTo: "User")
          .get();
      if (res.docs.isNotEmpty) {
        Get.offAllNamed(SideBarPage.id);
        Get.find<StorageServices>().saveCredentials(
            id: res.docs[0].id,
            email: res.docs[0]['email'],
            contactnumber: res.docs[0]['contactnumber'],
            address: res.docs[0]['address']);
      } else {
        Get.back();
        await FirebaseAuth.instance.signOut();
        Get.snackbar("Message", "User did not exist",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } on Exception catch (_) {
      Get.back();
      debugPrint(_.toString());
      await FirebaseAuth.instance.signOut();
      Get.snackbar("Message", "Login failed}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> launchInBrowserFacebook() async {
    if (!await launchUrl(
      Uri.parse(facebookUrl),
      webOnlyWindowName: '_blank',
    )) {
      throw Exception('Could not launch $facebookUrl');
    }
  }
}
