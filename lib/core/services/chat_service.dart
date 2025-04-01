import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final _fire = FirebaseFirestore.instance;
  saveMessage(Map<String, dynamic> message, String chatRoomId) async {
    try {
      await _fire
          .collection("chatRooms")
          .doc(chatRoomId)
          .collection("messages")
          .add(message);
    } catch (e) {
      rethrow;
    }
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessages(
      String chatRoomId) async {
    return _fire
        .collection("chatRooms")
        .doc(chatRoomId)
        .collection("messages")
        .snapshots();
  }
}
