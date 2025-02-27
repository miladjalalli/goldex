import 'dart:convert';

class BuyGoldByAmountAndWeightResponse {
  int? status;
  String? error;
  String? message;
  BuyGoldByAmountAndWeightResponseData? data;

  BuyGoldByAmountAndWeightResponse({
    this.status,
    this.error,
    this.message,
    this.data,
  });

  factory BuyGoldByAmountAndWeightResponse.fromJson(Map<String, dynamic> json) => BuyGoldByAmountAndWeightResponse(
    status: json["status"],
    error: json["error"],
    message: json["message"],
    data: BuyGoldByAmountAndWeightResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class BuyGoldByAmountAndWeightResponseData {
  double? fiatSpent;
  double? goldPurchasedMg;
  double? basePrice;
  double? fee;
  double? totalAmount;
  double? amountDeductedFromWallet;
  double? amountPaidViaGateway;
  bool? redirectToGateway;

  BuyGoldByAmountAndWeightResponseData({
    this.fiatSpent,
    this.goldPurchasedMg,
    this.basePrice,
    this.fee,
    this.totalAmount,
    this.amountDeductedFromWallet,
    this.amountPaidViaGateway,
    this.redirectToGateway,
  });

  factory BuyGoldByAmountAndWeightResponseData.fromJson(Map<String, dynamic> json) => BuyGoldByAmountAndWeightResponseData(
    fiatSpent: json["fiat_spent"] != null ? json["fiat_spent"].toDouble() : 0.0,
    goldPurchasedMg: json["gold_purchased_mg"] != null ? json["gold_purchased_mg"].toDouble() : 0.0,
    basePrice: json["base_price"] != null ? json["base_price"].toDouble() : 0.0,
    fee: json["fee"] != null ? json["fee"].toDouble() : 0.0,
    totalAmount: json["total_amount"] != null ? json["total_amount"].toDouble() : 0.0,
    amountDeductedFromWallet: json["amount_deducted_from_wallet"] != null ? json["amount_deducted_from_wallet"].toDouble() : 0.0,
    amountPaidViaGateway: json["amount_paid_via_gateway"] != null ? json["amount_paid_via_gateway"].toDouble() : 0.0,
    redirectToGateway: json["redirect_to_gateway"],
  );

  Map<String, dynamic> toJson() => {
    "fiat_spent": fiatSpent,
    "gold_purchased_mg": goldPurchasedMg,
    "base_price": basePrice,
    "fee": fee,
    "total_amount": totalAmount,
    "amount_deducted_from_wallet": amountDeductedFromWallet,
    "amount_paid_via_gateway": amountPaidViaGateway,
    "redirect_to_gateway": redirectToGateway,
  };
}
