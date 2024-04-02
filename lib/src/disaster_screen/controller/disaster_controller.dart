import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/model/disaster_model.dart';

class DisasterController extends GetxController {
  TextEditingController search = TextEditingController();
  Timer? debounce;
  RxList<DisasterModel> disasterDataMasterList = <DisasterModel>[].obs;

  RxList<DisasterModel> disasterData = <DisasterModel>[
    DisasterModel(
      disastername: "Huricane",
      images: "assets/images/hrrcn.png",
      buttonimage: "assets/images/hurricanebutton.png",
    ),
    DisasterModel(
      disastername: "Flood",
      images: "assets/images/fldtps.png",
      buttonimage: "assets/images/flood.png",
    ),
    DisasterModel(
      disastername: "Earthquake",
      images: "assets/images/erthqktps.png",
      buttonimage: "assets/images/earthquake.png",
    ),
    DisasterModel(
      disastername: "Fire",
      images: "assets/images/frtps.png",
      buttonimage: "assets/images/firebutton.png",
    ),
    DisasterModel(
      disastername: "Landslide",
      images: "assets/images/lndsldtps.png",
      buttonimage: "assets/images/landslide.png",
    ),
  ].obs;

  searchFunction({required String word}) async {
    try {
      if (word.isNotEmpty) {
        disasterData.clear();
        for (var i = 0; i < disasterDataMasterList.length; i++) {
          if (disasterDataMasterList[i]
              .disastername
              .toLowerCase()
              .toString()
              .contains(word.toLowerCase().toString())) {
            disasterData.add(disasterDataMasterList[i]);
          }
        }
      } else {
        disasterData.assignAll(disasterDataMasterList);
      }
    } catch (_) {
      log("ERROR (searchFunction): ${_.toString()}");
    }
  }

  @override
  void onInit() {
    disasterDataMasterList.assignAll(disasterData);
    super.onInit();
  }
}
