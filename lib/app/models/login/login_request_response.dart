class LoginRequestResponse {
  LoginResponseMessage? loginResponseMessage;

  LoginRequestResponse({this.loginResponseMessage});

  LoginRequestResponse.fromJson(Map<String, dynamic> json) {
    loginResponseMessage =
        json['msg'] != null ? LoginResponseMessage.fromJson(json['msg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (loginResponseMessage != null) {
      data['loginResponseMessage'] = loginResponseMessage!.toJson();
    }
    return data;
  }
}

class LoginResponseMessage {
  String? loginToken;
  String? accessToken;
  String? refreshToken;
  String? businessType;

  LoginResponseMessage({this.loginToken, this.accessToken, this.refreshToken});

  LoginResponseMessage.fromJson(Map<String, dynamic> json) {
    loginToken = json['login_token'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    businessType = json['business_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login_token'] = loginToken;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['business_type'] = businessType;
    return data;
  }
}
