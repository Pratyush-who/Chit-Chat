import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class dbServices {

  Stream<List<Map<String, dynamic>>> fetchUsersStream(String currentUserId) {
    return fire
        .collection("users")
        .where("uid", isNotEqualTo: currentUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

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
    final doc = await fire.collection("users").doc(uid).get();
    if (doc.exists) {
      return doc.data();
    }
    return null;
  } catch (e) {
    log("Error loading user: $e");
    return null;
  }
}


  Future<List<Map<String, dynamic>>?> fetchUsers(String currentUserId) async {
    try {
      final res = await fire
          .collection("users")
          .where("uid", isNotEqualTo: currentUserId)
          .get();

      return res.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  fetchUserStream(String? s) {}
}
