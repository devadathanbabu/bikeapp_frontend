// To parse this JSON data, do
//
//     final bike = bikeFromJson(jsonString);

import 'dart:convert';

List<Bike> bikeFromJson(String str) => List<Bike>.from(json.decode(str).map((x) => Bike.fromJson(x)));

String bikeToJson(List<Bike> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bike {
  String id;
  String name;
  String model;
  String yearofmanu;
  String cc;
  int v;

  Bike({
    required this.id,
    required this.name,
    required this.model,
    required this.yearofmanu,
    required this.cc,
    required this.v,
  });

  factory Bike.fromJson(Map<String, dynamic> json) => Bike(
    id: json["_id"],
    name: json["name"],
    model: json["model"],
    yearofmanu: json["yearofmanu"],
    cc: json["cc"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "model": model,
    "yearofmanu": yearofmanu,
    "cc": cc,
    "__v": v,
  };
}
