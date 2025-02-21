class SignUpResponse {
  String? status;
  String? error;
  String? message;

  SignUpResponse({this.status, this.error, this.message});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
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
