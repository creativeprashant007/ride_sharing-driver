import '../../config/config.dart' show Config;

class APIs {
  static const String baseUrl = Config.mapApiUrl;
  static const String refreshToken = "/api";
  static const String appApiUrl = "$baseUrl/api";
  static const String geocode = "$appApiUrl/geocode/json?";
  static const String placeAutoComplete = "$appApiUrl/place/autocomplete/json?";
  static const String placeDetails = "$appApiUrl/place/details/json?";
  //https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${placeName}&key=${mapKey}&sessiontoken=1234567890&components=country:np
}
