// To parse this JSON data, do
//
//     final livePrice18KResponse = livePrice18KResponseFromJson(jsonString);

import 'dart:convert';

LivePrice18KResponse livePrice18KResponseFromJson(String str) => LivePrice18KResponse.fromJson(json.decode(str));

String livePrice18KResponseToJson(LivePrice18KResponse data) => json.encode(data.toJson());

class LivePrice18KResponse {
  int? status;
  String? error;
  String? message;
  LivePrice18KResponseData? data;

  LivePrice18KResponse({this.status, this.error, this.message, this.data});

  LivePrice18KResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new LivePrice18KResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LivePrice18KResponseData {
  double? pricePerGram18k;
  String? unit;

  LivePrice18KResponseData({this.pricePerGram18k, this.unit});

  LivePrice18KResponseData.fromJson(Map<String, dynamic> json) {
    pricePerGram18k = json['price_per_gram_18k'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_per_gram_18k'] = this.pricePerGram18k;
    data['unit'] = this.unit;
    return data;
  }
}
