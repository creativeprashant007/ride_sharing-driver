import 'dart:async';

import 'package:driver/app/models/geocode/geocode_request.dart';
import 'package:driver/app/models/geocode/geocode_response.dart';
import 'package:driver/app/services/repositories/app_repo.dart';
import 'package:driver/app/services/services/app_services.dart';
import 'package:driver/app/widgets/circular_loader.dart';
import 'package:driver/config/config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
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
  String availabilityTitle = "GO ONLINE";
  bool isAvailable = false;
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );
  CircularLoader circularLoader = Get.put(CircularLoader());
  BuildContext? context;
  AppRepo? appRepo;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Geolocator? geolocator;
  var locationOptions = const LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 4,
  );
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

  onGoOnlineButtonClick() {
    if (!isAvailable) {
      goOnline();
      getLocationUpdate();
      isAvailable = true;
    } else {
      goOffline();
      isAvailable = false;
    }
    update();
  }

  void goOnline() {
    Geofire.initialize("driversAvailable");
    Geofire.setLocation(
      currentFirebaseUser!.uid,
      userCurrentPosition!.latitude,
      userCurrentPosition!.longitude,
    );
    tripRequestRef = FirebaseDatabase.instance
        .ref()
        .child("drivers/${currentFirebaseUser!.uid}/newtrip");
    tripRequestRef!.set("waiting");
    tripRequestRef!.onValue.listen((DatabaseEvent event) {
      print("event ${event}");
    });
  }

  void goOffline() async {
    Geofire.removeLocation(currentFirebaseUser!.uid);
    tripRequestRef!.onDisconnect();
    tripRequestRef!.remove();
    tripRequestRef = null;
  }

  void getLocationUpdate() {
    homePostionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 2,
      ),
    ).listen((position) {
      userCurrentPosition = position;

      if (isAvailable) {
        Geofire.setLocation(
          currentFirebaseUser!.uid,
          position.latitude,
          position.longitude,
        );
      }
      LatLng pos = LatLng(position.latitude, position.longitude);
      CameraPosition cameraPosition = CameraPosition(target: pos, zoom: 14);
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }
}
