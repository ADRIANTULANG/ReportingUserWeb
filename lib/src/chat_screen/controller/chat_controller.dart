import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:responderuserweb/model/chat_model.dart';
import 'package:responderuserweb/services/loading_dialog.dart';
import 'package:responderuserweb/src/report_details_screen/controller/report_details_controller.dart';

class ChatController extends GetxController {
  TextEditingController message = TextEditingController();
  StreamSubscription<dynamic>? chatListener;
  Stream? chatStream;
  String userID = FirebaseAuth.instance.currentUser!.uid;

  RxList<Chat> chatList = <Chat>[].obs;

  ScrollController scrollController = ScrollController();

  getChats() async {
    try {
      chatStream = FirebaseFirestore.instance
          .collection('chat')
          .where('reportID',
              isEqualTo:
                  Get.find<ReportDetailsController>().reportDetails!.documentId)
          .orderBy('datecreated', descending: true)
          .limit(100)
          .snapshots();

      chatListener = chatStream!.listen((event) async {
        List data = [];
        for (var report in event.docs) {
          Map mapdata = report.data();
          mapdata['id'] = report.id;
          data.add(mapdata);
        }
        chatList.assignAll(chatFromJson(jsonEncode(data)));
        chatList.sort((a, b) => a.datecreated.compareTo(b.datecreated));
        Future.delayed(const Duration(seconds: 1), () {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });
      });
    } catch (_) {}
  }

  navigateBack() async {
    Get.back();
  }

  sendMessage({required String messagetosend}) async {
    message.clear();
    await FirebaseFirestore.instance.collection('chat').add({
      "reportID": Get.find<ReportDetailsController>().reportDetails!.documentId,
      "chats": messagetosend,
      "url": "",
      "datecreated": DateTime.now().toString(),
      "sender": userID,
      "type": "text",
    });
  }

  sendImage() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();
    if (image != null) {
      LoadingDialog.showLoadingDialog();

      final ref = FirebaseStorage.instance
          .ref()
          .child("Document/${DateTime.now().microsecondsSinceEpoch}");
      var uploadTask = ref.putData(image);
      final snapshot = await uploadTask.whenComplete(() {});
      String fileLink = await snapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('chat').add({
        "reportID":
            Get.find<ReportDetailsController>().reportDetails!.documentId,
        "chats": "",
        "url": fileLink,
        "sender": userID,
        "datecreated": DateTime.now().toString(),
        "type": "image"
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        Get.back();
      });
    }
  }
}
