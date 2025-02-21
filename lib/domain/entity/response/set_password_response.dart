class SetPasswordResponse {
  String? status;
  String? error;
  String? message;

  SetPasswordResponse({this.status, this.error, this.message});

  SetPasswordResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    error = json['Error'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Error'] = this.error;
    data['Message'] = this.message;
    return data;
  }
}
