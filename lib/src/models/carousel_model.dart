// To parse this JSON data, do
//
//     final carouselModel = carouselModelFromJson(jsonString);

import 'dart:convert';

CarouselModel carouselModelFromJson(String str) => CarouselModel.fromJson(json.decode(str));

String carouselModelToJson(CarouselModel data) => json.encode(data.toJson());

class CarouselModel {
  final String? title;
  final String? description;
  final String? imgUrl;
  final String? date;
  final bool? status;

  CarouselModel({
    this.title,
    this.description,
    this.date,
    this.imgUrl,
    this.status,
  });

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
    title: json["title"],
    description: json["description"],
    date: json["date"],
    imgUrl: json["imgUrl"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "date": date,
    "imgUrl": imgUrl,
    "status": status,
  };
}
