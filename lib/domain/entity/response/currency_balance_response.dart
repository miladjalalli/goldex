class CurrencyBalanceResponse {
  int? status;
  String? error;
  String? message;
  CurrencyBalanceResponseData? data;

  CurrencyBalanceResponse({this.status, this.error, this.message, this.data});

  CurrencyBalanceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new CurrencyBalanceResponseData.fromJson(json['data']) : null;
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

class CurrencyBalanceResponseData {
  double? currencyBalance;

  CurrencyBalanceResponseData({this.currencyBalance});

  CurrencyBalanceResponseData.fromJson(Map<String, dynamic> json) {
    currencyBalance = json['currency_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_balance'] = this.currencyBalance;
    return data;
  }
}
