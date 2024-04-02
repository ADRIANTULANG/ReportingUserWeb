import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/model/report_model.dart';

class TrackingController extends GetxController {
  TextEditingController search = TextEditingController();
  RxList<Report> trackingReport = <Report>[].obs;
  RxList<Report> trackingReportMasterList = <Report>[].obs;
  Timer? debounce;
  getReports() async {
    try {
      var res = await FirebaseFirestore.instance
          .collection('Reports')
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where(Filter.or(
            Filter("status", isEqualTo: 'Pending'),
            Filter("status", isEqualTo: 'Accepted'),
          ))
          .orderBy('dateTime', descending: true)
          .get();
      List data = [];
      var reports = res.docs;
      for (var i = 0; i < reports.length; i++) {
        Map mapdata = reports[i].data();
        mapdata['documentID'] = reports[i].id;
        mapdata['dateTime'] = mapdata['dateTime'].toDate().toString();
        mapdata['remarks'] = mapdata['remarks'] ?? "";
        data.add(mapdata);
      }
      trackingReport.assignAll(reportFromJson(jsonEncode(data)));
      trackingReportMasterList.assignAll(reportFromJson(jsonEncode(data)));
    } catch (_) {
      log("ERROR (getReports): ${_.toString()}");
    }
  }

  searchFunction({required String word}) async {
    try {
      if (word.isNotEmpty) {
        trackingReport.clear();
        for (var i = 0; i < trackingReportMasterList.length; i++) {
          if (trackingReportMasterList[i]
              .type
              .toLowerCase()
              .toString()
              .contains(word.toLowerCase().toString())) {
            trackingReport.add(trackingReportMasterList[i]);
          }
        }
      } else {
        trackingReport.assignAll(trackingReportMasterList);
      }
    } catch (_) {
      log("ERROR (searchFunction): ${_.toString()}");
    }
  }

  @override
  void onInit() {
    getReports();
    super.onInit();
  }
}
