class RegisterResponse {
  String? status;
  String? error;
  String? message;
  RegisterResponseData? data;

  RegisterResponse({this.status, this.error, this.data, this.message});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    error = json['Error'];
    data = json['Data'] != null ? new RegisterResponseData.fromJson(json['Data']) : null;
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Error'] = this.error;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Message'] = this.message;
    return data;
  }
}

class RegisterResponseData {
  String? field;
  String? code;
  int? codeExpire;
  String? confirmToken;

  RegisterResponseData({this.field, this.code, this.codeExpire, this.confirmToken});

  RegisterResponseData.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    code = json['code'];
    codeExpire = json['code_expire'];
    confirmToken = json['confirmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['code'] = this.code;
    data['code_expire'] = this.codeExpire;
    data['confirmToken'] = this.confirmToken;
    return data;
  }
}
