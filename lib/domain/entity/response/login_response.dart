class LoginResponse {
  String? status;
  String? error;
  LoginResponseData? data;

  LoginResponse({this.status, this.error, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    error = json['Error'];
    data = json['Data'] != null ? new LoginResponseData.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Error'] = this.error;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginResponseData {
  String? token;
  String? tokenType;
  int? tokenExpire;

  LoginResponseData({this.token, this.tokenType, this.tokenExpire});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    tokenExpire = json['token_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    data['token_expire'] = this.tokenExpire;
    return data;
  }
}
