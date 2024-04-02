// To parse this JSON data, do
//
//     final disasterModel = disasterModelFromJson(jsonString);

import 'dart:convert';

List<DisasterModel> disasterModelFromJson(String str) =>
    List<DisasterModel>.from(
        json.decode(str).map((x) => DisasterModel.fromJson(x)));

String disasterModelToJson(List<DisasterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DisasterModel {
  String disastername;
  String images;
  String buttonimage;

  DisasterModel({
    required this.disastername,
    required this.images,
    required this.buttonimage,
  });

  factory DisasterModel.fromJson(Map<String, dynamic> json) => DisasterModel(
        disastername: json["disastername"],
        images: json["images"],
        buttonimage: json["buttonimage"],
      );

  Map<String, dynamic> toJson() => {
        "disastername": disastername,
        "images": images,
        "buttonimage": buttonimage,
      };
}
