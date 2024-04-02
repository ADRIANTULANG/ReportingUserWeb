import 'dart:convert';

List<Firstaid> firstaidFromJson(String str) =>
    List<Firstaid>.from(json.decode(str).map((x) => Firstaid.fromJson(x)));

String firstaidToJson(List<Firstaid> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Firstaid {
  String firstaidname;
  String link;
  String image;

  Firstaid({
    required this.firstaidname,
    required this.link,
    required this.image,
  });

  factory Firstaid.fromJson(Map<String, dynamic> json) => Firstaid(
        firstaidname: json["firstaidname"],
        link: json["link"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "firstaidname": firstaidname,
        "link": link,
        "image": image,
      };
}
