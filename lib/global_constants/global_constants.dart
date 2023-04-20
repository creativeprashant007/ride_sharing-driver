import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';

import '../app/models/user/app_user.dart';

late final Dio dio;
bool internetstatus = true;
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
User? currentFirebaseUser;
DriverData? currentUserInfo;
StreamSubscription<Position>? homePostionStream;
String userCurrentAddress = "Current Address";
DatabaseReference? tripRequestRef;
