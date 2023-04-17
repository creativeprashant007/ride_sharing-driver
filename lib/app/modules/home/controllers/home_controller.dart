import 'dart:async';

import 'package:driver/app/models/geocode/geocode_request.dart';
import 'package:driver/app/models/geocode/geocode_response.dart';
import 'package:driver/app/services/repositories/app_repo.dart';
import 'package:driver/app/services/services/app_services.dart';
import 'package:driver/app/widgets/circular_loader.dart';
import 'package:driver/config/config.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../functions/universal_functions.dart';
import '../../../../global_constants/global_constants.dart';

class HomeController extends GetxController {
  final Completer<GoogleMapController> googleMapCompleter =
      Completer<GoogleMapController>();
  late GoogleMapController mapController;
  String userHomeAddress = "Add Home";
  Position? userCurrentPosition;

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );
  CircularLoader circularLoader = Get.put(CircularLoader());
  BuildContext? context;
  AppRepo? appRepo;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    appRepo = Get.put(AppRepoImplementaion());
    await callPermission();
    setupPositionLocator();
    super.onInit();
  }

  onMapCreated({GoogleMapController? controller}) {
    googleMapCompleter.complete(controller);
    mapController = controller!;
    update();
  }

  void setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );

    userCurrentPosition = position;

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = CameraPosition(target: pos, zoom: 17);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    await getUserLocation();
  }

  getUserLocation() async {
    circularLoader.showCircularLoader(context!);
    GeocodeRequest request = GeocodeRequest(
      latlng:
          "${userCurrentPosition!.latitude},${userCurrentPosition!.longitude}",
      key: Config.mapKey,
    );
    final response = await appRepo!.getUserCurrentAddress(request: request);
    circularLoader.hideCircularLoader();
    if (response is GeocodeResponse) {
      userHomeAddress = response.results![0].formattedAddress!;
      userCurrentAddress = userHomeAddress;
      update();
    }
  }
}
