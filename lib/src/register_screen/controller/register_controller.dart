import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:responderuserweb/services/storage_services.dart';

import '../../../services/loading_dialog.dart';
import '../../sidebar_wrapper_screen/views/sidebar_wrapper_main_view.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool hasFrontImage = false.obs;
  RxBool hasBackImage = false.obs;
  Uint8List? imageFront;
  Uint8List? imageBack;

  getImageFront() async {
    imageFront = await ImagePickerWeb.getImageAsBytes();
    if (imageFront != null) {
      hasFrontImage.value = true;
    }
  }

  getImageBack() async {
    imageBack = await ImagePickerWeb.getImageAsBytes();
    if (imageBack != null) {
      hasBackImage.value = true;
    }
  }

  createAccount() async {
    try {
      LoadingDialog.showLoadingDialog();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      final reffront = FirebaseStorage.instance
          .ref()
          .child("Document/${DateTime.now().microsecondsSinceEpoch}");
      var frontuploadTask = reffront.putData(imageFront!);
      final frontsnapshot = await frontuploadTask.whenComplete(() {});
      String frontfileLink = await frontsnapshot.ref.getDownloadURL();

      final refback = FirebaseStorage.instance
          .ref()
          .child("Document/${DateTime.now().microsecondsSinceEpoch}");
      var backuploadTask = refback.putData(imageBack!);
      final backsnapshot = await backuploadTask.whenComplete(() {});
      String backfileLink = await backsnapshot.ref.getDownloadURL();
      final docUser = FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      var jsonData = {
        'name': name.text,
        'address': address.text,
        'email': email.text,
        'profilePicture':
            'https://cdn-icons-png.flaticon.com/256/149/149071.png',
        'status': 'Active',
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'type': 'User',
        'contactnumber': contactno.text,
        'front': frontfileLink,
        'back': backfileLink,
        "fcmToken": ""
      };
      await docUser.set(jsonData);
      Get.back();
      Get.find<StorageServices>().saveCredentials(
          id: FirebaseAuth.instance.currentUser!.uid,
          email: email.text,
          contactnumber: contactno.text,
          address: address.text);
      Get.offAllNamed(SideBarPage.id);
    } catch (_) {
      Get.back();
      log("ERROR (createReport): ${_.toString()}");
    }
  }
}
