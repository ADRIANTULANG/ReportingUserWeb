import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:responderuserweb/services/location_services.dart';
import 'package:responderuserweb/src/sidebar_wrapper_screen/controller/sidebar_wrapper_controller.dart';
import 'package:responderuserweb/src/tracking_screen/controller/tracking_controller.dart';

import '../../../services/loading_dialog.dart';
import '../../../services/storage_services.dart';

class DashboardController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  TextEditingController description = TextEditingController();
  RxString addressValue = 'PUROK 1'.obs;
  Uint8List? image;
  RxBool hasImage = false.obs;
  List<String> addressList = [
    "PUROK 1",
    "PUROK 2A",
    "PUROK 2B",
    "PUROK 3A-1",
    "PUROK 3A-2",
    "PUROK 3B",
    "PUROK 4A",
    "PUROK 4B",
    "PUROK 5",
    "PUROK 6"
  ];
  RxString accidentValue = 'Fire'.obs;

  List<String> accidentType = [
    'Fire',
    'Hurricane',
    'Flood',
    'Earthquake',
    'Landslide',
    'Others'
  ];
  navigateToFeature({required String route}) async {
    Get.find<SideBarController>().currentRoute.value = route;
    Get.find<StorageServices>().saveRoute(screen: route);
  }

  getImage() async {
    image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      hasImage.value = true;
    }
  }

  createReport() async {
    try {
      LoadingDialog.showLoadingDialog();
      final ref = FirebaseStorage.instance
          .ref()
          .child("Document/${DateTime.now().microsecondsSinceEpoch}");
      var uploadTask = ref.putData(image!);
      final snapshot = await uploadTask.whenComplete(() {});
      String fileLink = await snapshot.ref.getDownloadURL();
      double latitude = Get.find<LocationServices>().locationData!.latitude!;
      double longitude = Get.find<LocationServices>().locationData!.longitude!;
      await FirebaseFirestore.instance.collection('Reports').add({
        'name': name.text,
        'address': addressValue.value,
        'caption': description.text,
        'status': 'Pending',
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'contactnumber': contactnumber.text,
        'imageURL': fileLink,
        'dateTime': DateTime.now(),
        'lat': latitude,
        'long': longitude,
        'responder': '',
        'day': DateTime.now().day,
        'month': DateTime.now().month,
        'year': DateTime.now().year,
        'type': accidentValue.value,
        'remarks': ""
      });
      Get.back();
      Get.back();
      Get.find<TrackingController>().getReports();
    } catch (_) {
      Get.back();
      log("ERROR (createReport): ${_.toString()}");
    }
  }
}
