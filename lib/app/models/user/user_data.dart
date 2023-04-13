class UserDataResponse {
  String? name;
  String? phone;
  String? address;

  UserDataResponse({this.name, this.phone, this.address});

  UserDataResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    return data;
  }
}
