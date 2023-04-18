import 'package:firebase_database/firebase_database.dart';

class DriverData {
  String? fullName;
  String? email;
  String? phone;
  String? id;
  String? chasisNumber;
  String? driverExperience;
  String? vechicleCategory;
  String? vechicleNumber;
  String? billBookNumber;
  String? licenseNumber;
  String? gender;
  bool? isVerify;

  DriverData({
    this.fullName,
    this.email,
    this.phone,
    this.id,
    this.billBookNumber,
    this.chasisNumber,
    this.vechicleCategory,
    this.vechicleNumber,
    this.licenseNumber,
    this.driverExperience,
    this.gender,
    this.isVerify,
  });

  DriverData.fromSnapsot(DataSnapshot snapshot) {
    id = snapshot.key;
    phone = (snapshot.value as dynamic)['phone'];
    email = (snapshot.value as dynamic)['email'];
    fullName = (snapshot.value as dynamic)['username'];
    chasisNumber = (snapshot.value as dynamic)['chasis_number'];
    driverExperience = (snapshot.value as dynamic)['driver_experience'];
    licenseNumber = (snapshot.value as dynamic)['license_number'];
    vechicleCategory = (snapshot.value as dynamic)['vechicle_category'];
    vechicleNumber = (snapshot.value as dynamic)['vechicle_number'];
    billBookNumber = (snapshot.value as dynamic)['billbook_number'];
    gender = (snapshot.value as dynamic)['gender'];
    isVerify = (snapshot.value as dynamic)["isVerify"];
  }
}
