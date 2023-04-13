class GeocodeRequest {
  String? latlng;
  String? key;

  GeocodeRequest({this.latlng, this.key});

  GeocodeRequest.fromJson(Map<String, dynamic> json) {
    latlng = json['latlng'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latlng'] = this.latlng;
    data['key'] = this.key;
    return data;
  }
}
