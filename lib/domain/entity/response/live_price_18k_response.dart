// To parse this JSON data, do
//
//     final livePrice18KResponse = livePrice18KResponseFromJson(jsonString);

import 'dart:convert';

LivePrice18KResponse livePrice18KResponseFromJson(String str) => LivePrice18KResponse.fromJson(json.decode(str));

String livePrice18KResponseToJson(LivePrice18KResponse data) => json.encode(data.toJson());

class LivePrice18KResponse {
  double? pricePerGram18K;
  String? unit;

  LivePrice18KResponse({
    this.pricePerGram18K,
    this.unit,
  });

  factory LivePrice18KResponse.fromJson(Map<String, dynamic> json) => LivePrice18KResponse(
    pricePerGram18K: json["price_per_gram_18k"].toDouble(),
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "price_per_gram_18k": pricePerGram18K,
    "unit": unit,
  };
}
