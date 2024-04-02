import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responderuserweb/model/report_model.dart';
import 'package:responderuserweb/services/loading_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:responderuserweb/src/history_screen/controller/history_controller.dart';
import '../../../model/responder_details.dart';

class ReportDetailsController extends GetxController {
  ResponderDetails? responderDetails;
  Report? reportDetails;
  RxSet<Marker> markers = <Marker>{}.obs;
  final Completer<GoogleMapController> completerController =
      Completer<GoogleMapController>();
  GoogleMapController? mapController;
  LatLngBounds? bounds;
  CameraPosition? kGooglePlex;
  RxBool isShowContainer = true.obs;
  TextEditingController remarks = TextEditingController();
  StreamSubscription<dynamic>? locationListener;
  Stream? locationStreamer;
  String distance = '';
  String time = '';
  RxDouble defaultLatitude = 7.071435630791344.obs;
  RxDouble defaultLongitude = 125.60360666266267.obs;
  RxBool hasReponder = false.obs;
  RxBool hasImage = false.obs;
  RxString remarksText = ''.obs;

  initializedData() async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      LoadingDialog.showLoadingDialog();
      await getResponderDetails();
      await listenToLocationOfResponder();
      Get.back();
    });
  }

  getResponderDetails() async {
    try {
      if (reportDetails!.responder != "" ||
          reportDetails!.responder.isNotEmpty) {
        var responder = await FirebaseFirestore.instance
            .collection('Users')
            .doc(reportDetails!.responder)
            .get();
        if (responder.exists) {
          var responderDetail = responder.data();
          responderDetails =
              responderDetailsFromJson(jsonEncode(responderDetail));
          hasReponder.value = true;
        }
      } else {
        hasReponder.value = false;
      }
    } catch (_) {}
  }

  listenToLocationOfResponder() async {
    try {
      locationStreamer = FirebaseFirestore.instance
          .collection('Reports')
          .doc(reportDetails!.documentId)
          .snapshots();

      locationListener = locationStreamer!.listen((event) async {
        Map data = event.data();
        // if (data.containsKey('responderLat')) {
        //   var distanceAndTime = await fetchDistanceAndTime(
        //       LatLng(reportDetails!.lat, reportDetails!.long),
        //       LatLng(data['responderLat'], data['responderLong']));
        //   time = distanceAndTime['durationText'];
        //   distance = distanceAndTime['distanceText'];
        // }
        if (data['imageURL'] == "" ||
            data['imageURL'].isEmpty ||
            data['imageURL'] == null ||
            data['imageURL'] == "null") {
          hasImage.value = false;
        } else {
          hasImage.value = true;
        }
        markers.clear();
        markers.add(Marker(
          markerId: MarkerId(reportDetails!.name),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(reportDetails!.lat, reportDetails!.long),
          infoWindow: InfoWindow(
            title: reportDetails!.caption,
            snippet: 'Status: ${reportDetails!.status}',
          ),
        ));
        if (data.containsKey('responderLat')) {
          markers.add(Marker(
            markerId: const MarkerId("ResponderLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(data['responderLat'], data['responderLong']),
            infoWindow: const InfoWindow(
              title: "Responder",
              // snippet: "${data['name']} ($distance - $time)",
            ),
          ));
          mapController!.animateCamera(CameraUpdate.newLatLng(
              LatLng(data['responderLat'], data['responderLong'])));
        } else {
          mapController!.animateCamera(CameraUpdate.newLatLng(LatLng(
            reportDetails!.lat,
            reportDetails!.long,
          )));
        }
      });
    } catch (_) {}
  }

  Future<Map<String, dynamic>> fetchDistanceAndTime(
      LatLng origin, LatLng destination) async {
    final headers = {
      'Access-Control-Allow-Origin': '*', // Set the desired origin
    };
    const String apiKey = 'AIzaSyDdXaMN5htLGHo8BkCfefPpuTauwHGXItU';

    final String apiUrl =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'OK') {
        final legs = data['routes'][0]['legs'][0];
        final distanceText = legs['distance']['text'];
        final distanceValue = legs['distance']['value'];
        final durationText = legs['duration']['text'];
        final durationValue = legs['duration']['value'];

        return {
          'distanceText': distanceText,
          'distanceValue': distanceValue,
          'durationText': durationText,
          'durationValue': durationValue,
        };
      }
    }
    throw Exception('Failed to fetch distance and time');
  }

  updateRemarks({required String message}) async {
    try {
      LoadingDialog.showLoadingDialog();
      await FirebaseFirestore.instance
          .collection('Reports')
          .doc(reportDetails!.documentId)
          .update({"remarks": message});
      reportDetails!.remarks = message;
      remarksText.value = message;
      Get.back();
      Get.find<HistoryController>().getHistory();
    } catch (_) {}
  }
}
