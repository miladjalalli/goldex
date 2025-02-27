import 'dart:convert';

class SellGoldResponse {
  int? status;
  String? error;
  String? message;
  SellGoldResponseData? data;

  SellGoldResponse({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory SellGoldResponse.fromJson(Map<String, dynamic> json) => SellGoldResponse(
    status: json["status"],
    error: json["error"],
    message: json["message"],
    data: SellGoldResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class SellGoldResponseData {
  double? goldSoldMg;
  double? basePrice;
  double? fee;
  double? fiatReceived;

  SellGoldResponseData({
    this.goldSoldMg,
    this.basePrice,
    this.fee,
    this.fiatReceived,
  });

  factory SellGoldResponseData.fromJson(Map<String, dynamic> json) => SellGoldResponseData(
    goldSoldMg: json["gold_sold_mg"] != null ? json["gold_sold_mg"].toDouble() : 0.0,
    basePrice: json["base_price"] != null ? json["base_price"].toDouble() : 0.0,
    fee: json["fee"] != null ? json["fee"].toDouble() : 0.0,
    fiatReceived: json["fiat_received"] != null ? json["fiat_received"].toDouble() : 0.0,
  );

  Map<String, dynamic> toJson() => {
    "gold_sold_mg": goldSoldMg,
    "base_price": basePrice,
    "fee": fee,
    "fiat_received": fiatReceived,
  };
}
