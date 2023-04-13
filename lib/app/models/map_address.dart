class MapAddress {
  String placeName;
  double latitude;
  double longitude;
  String placeId;
  String placeFormattedAddress;

  MapAddress({
    required this.latitude,
    required this.longitude,
    required this.placeFormattedAddress,
    required this.placeId,
    required this.placeName,
  });
}
