class GiftCardsResponse {
  int? status;
  String? error;
  String? message;
  GiftCardsResponseData? data;

  GiftCardsResponse({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory GiftCardsResponse.fromJson(Map<String, dynamic> json) => GiftCardsResponse(
    status: json["status"],
    error: json["error"],
    message: json["message"],
    data: GiftCardsResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class GiftCardsResponseData {
  List<GiftCard>? giftCards;

  GiftCardsResponseData({
     this.giftCards,
  });

  factory GiftCardsResponseData.fromJson(Map<String, dynamic> json) => GiftCardsResponseData(
    giftCards: List<GiftCard>.from(json["gift_cards"].map((x) => GiftCard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "gift_cards": List<dynamic>.from(giftCards!.map((x) => x.toJson())),
  };
}

class GiftCard {
  int? id;
  String? cardCode;
  double? goldAmount;
  double? purchasedBy;
  DateTime? purchasedAt;
  String? status;
  double? redeemedBy;
  DateTime? redeemedAt;

  GiftCard({
    this.id,
    this.cardCode,
    this.goldAmount,
    this.purchasedBy,
    this.purchasedAt,
    this.status,
    this.redeemedBy,
    this.redeemedAt,
  });

  factory GiftCard.fromJson(Map<String, dynamic> json) => GiftCard(
    id: json["id"],
    cardCode: json["card_code"] ?? "",
    goldAmount: json["gold_amount"] != null ? json["gold_amount"].toDouble() : 0.0,
    purchasedBy: json["purchased_by"] != null ? json["purchased_by"].toDouble() : 0.0,
    purchasedAt: json["purchased_at"] != null ? DateTime.parse(json["purchased_at"]) : null,
    status: json["status"] ?? "" ,
    redeemedBy: json["redeemed_by"] != null ? json["redeemed_by"].toDouble() : 0.0,
    redeemedAt: json["redeemed_at"]  != null ? DateTime.parse(json["redeemed_at"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "card_code": cardCode,
    "gold_amount": goldAmount,
    "purchased_by": purchasedBy,
    "purchased_at": purchasedAt!.toIso8601String(),
    "status": status,
    "redeemed_by": redeemedBy,
    "redeemed_at": redeemedAt!.toIso8601String(),
  };
}
