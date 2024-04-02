import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/firstaid_model.dart';

class FirstaidController extends GetxController {
  TextEditingController search = TextEditingController();
  Timer? debounce;

  RxList<Firstaid> firstAidDataMasterList = <Firstaid>[].obs;
  RxList<Firstaid> firstAidData = <Firstaid>[
    Firstaid(
        firstaidname: "Burn",
        link: "https://www.verywellhealth.com/first-aid-for-burns-5208710",
        image: "assets/images/burn 1.png"),
    Firstaid(
        firstaidname: "Bleeding",
        link: "https://www.verywellhealth.com/how-to-control-bleeding-1298304",
        image: "assets/images/blood-droplet 1.png"),
    Firstaid(
        firstaidname: "Injury",
        link: "https://www.verywellhealth.com/sports-injuries-4013926",
        image: "assets/images/injury 1.png"),
    Firstaid(
        firstaidname: "Allergies",
        link:
            "https://www.verywellhealth.com/how-food-allergy-is-treated-4773095",
        image: "assets/images/antibacterial 1.png"),
    Firstaid(
        firstaidname: "Heart Attack",
        link: "https://www.verywellhealth.com/heart-attack-7229012",
        image: "assets/images/heart-attack 1.png"),
    Firstaid(
        firstaidname: "Shock",
        link: "https://www.verywellhealth.com/types-of-shock-4018329",
        image: "assets/images/shock-sign 1.png"),
  ].obs;

  Future<void> urlLauncher({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  searchFunction({required String word}) async {
    try {
      if (word.isNotEmpty) {
        firstAidData.clear();
        for (var i = 0; i < firstAidDataMasterList.length; i++) {
          if (firstAidDataMasterList[i]
              .firstaidname
              .toLowerCase()
              .toString()
              .contains(word.toLowerCase().toString())) {
            firstAidData.add(firstAidDataMasterList[i]);
          }
        }
      } else {
        firstAidData.assignAll(firstAidDataMasterList);
      }
    } catch (_) {
      log("ERROR (searchFunction): ${_.toString()}");
    }
  }

  @override
  void onInit() {
    firstAidDataMasterList.assignAll(firstAidData);
    super.onInit();
  }
}
