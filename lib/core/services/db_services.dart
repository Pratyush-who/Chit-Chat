import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class dbServices {
  final fire = FirebaseFirestore.instance;

  Future<void> saveUser(Map<String, dynamic> userData) async {
    try {
      await fire.collection("users").doc(userData["uid"]).set(userData);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> loadUser(String uid) async {
    try {
      final res = await fire.collection("users").doc(uid).get();

      if (res.data() != null) {
        log("User fetched success");
        return res.data();
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
