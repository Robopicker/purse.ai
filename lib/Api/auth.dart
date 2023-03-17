// ignore_for_file: empty_catches, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:purse_ai_app/Bloc/user/user_event.dart';

void createProfile(CreateAccount userData)  async {
  try {
  var db = FirebaseFirestore.instance;
  var users = db.collection('user').doc();
  await users.set({
  "name": userData.name,
  "password": userData.password,
  "email": userData.email
}).then(
      (value) => print("Appointment booked successfully!"),
      onError: (e) => print("Error booking appointment: $e"));
  // ignore: avoid_catches_without_on_clauses
  } catch(err) {
  }
} 