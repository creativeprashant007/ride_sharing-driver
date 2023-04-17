import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

late final Dio dio;
bool internetstatus = true;
final FirebaseAuth auth = FirebaseAuth.instance;

String userCurrentAddress = "Current Address";