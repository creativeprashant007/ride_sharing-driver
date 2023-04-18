import 'package:firebase_database/firebase_database.dart';

class DriverData {
  String? fullName;
  String? email;
  String? phone;
  String? id;

  DriverData({
    this.fullName,
    this.email,
    this.phone,
    this.id,
  });

  DriverData.fromSnapsot(DataSnapshot snapshot) {
    id = snapshot.key;
    phone = (snapshot.value as dynamic)['phone'];
    email = (snapshot.value as dynamic)['email'];
    fullName = (snapshot.value as dynamic)['fullname'];
  }
}
