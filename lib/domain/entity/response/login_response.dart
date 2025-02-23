class LoginResponse {
  String? status;
  String? error;
  String? message;
  LoginResponseData? data;

  LoginResponse({this.status, this.error, this.data, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    error = json['Error'];
    data = json['Data'] != null ? new LoginResponseData.fromJson(json['Data']) : null;
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Error'] = this.error;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Message']= this.message ;
    return data;
  }
}

class LoginResponseData {
  String? token;
  String? tokenType;
  int? tokenExpire;
  User? user;

  LoginResponseData({this.token, this.tokenType, this.tokenExpire, this.user});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    tokenExpire = json['token_expire'];
    user = User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    data['token_expire'] = this.tokenExpire;
    data['user'] = user!.toJson();
    return data;
  }
}

class User {
  String status;
  String name;
  String lastname;

  User({
    required this.status,
    required this.name,
    required this.lastname,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json["status"] ?? "",
    name: json["name"] ?? "",
    lastname: json["lastname"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "name": name,
    "lastname": lastname,
  };
}