import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responderuserweb/model/report_model.dart';

class HistoryController extends GetxController {
  TextEditingController search = TextEditingController();
  RxList<Report> historyReport = <Report>[].obs;
  RxList<Report> historyReportMasterList = <Report>[].obs;
  Timer? debounce;

  getHistory() async {
    try {
      var res = await FirebaseFirestore.instance
          .collection('Reports')
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('status', isEqualTo: "Done")
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
      historyReport.assignAll(reportFromJson(jsonEncode(data)));
      historyReportMasterList.assignAll(reportFromJson(jsonEncode(data)));
    } catch (_) {
      log("ERROR (getHistory): ${_.toString()}");
    }
  }

  searchFunction({required String word}) async {
    try {
      if (word.isNotEmpty) {
        historyReport.clear();
        for (var i = 0; i < historyReportMasterList.length; i++) {
          if (historyReportMasterList[i]
              .type
              .toLowerCase()
              .toString()
              .contains(word.toLowerCase().toString())) {
            historyReport.add(historyReportMasterList[i]);
          }
        }
      } else {
        historyReport.assignAll(historyReportMasterList);
      }
    } catch (_) {
      log("ERROR (searchFunction): ${_.toString()}");
    }
  }

  @override
  void onInit() {
    getHistory();
    super.onInit();
  }
}
