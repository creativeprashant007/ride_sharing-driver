import '../../models/geocode/geocode_request.dart';

abstract class AppRepo {
  Future getUserInfo();
  Future getUserCurrentAddress({GeocodeRequest? request});
  Future searchDestination(String placeName);
  Future placeDetails(String placeId);
}
