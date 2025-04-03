import 'dart:async';

import 'package:firebasechat/core/models/message_modal.dart';
import 'package:firebasechat/core/models/user_models.dart';
import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/chat_service.dart';
import 'package:flutter/cupertino.dart';

class ChatViewModel extends BaseView {
  final ChatService _chatService;
  final UserModel currentUser;
  final UserModel _receiver;

  StreamSubscription? subscription;

  ChatViewModel(this._chatService, this.currentUser, this._receiver) {
    getchatRoom();
    subscription = _chatService.getMessages(chatRoomId).listen(
  (messages) {
    print("Received ${messages.docs.length} messages"); // Debug
    _messages = messages.docs.map((e) {
      print("Message data: ${e.data()}"); // Debug each message
      return Message.fromMap(e.data());
    }).toList();
    notifyListeners();
  },
  onError: (e) => print("Stream error: $e"), // Error handling
);
  }
  String chatRoomId = '';

  final _messageController = TextEditingController();

  TextEditingController get controller => _messageController;

  List<Message> _messages = [];

  List<Message> get messages => _messages;

  getchatRoom() {
  if (currentUser.uid.hashCode > _receiver.uid.hashCode) {
    chatRoomId = '${currentUser.uid}-${_receiver.uid}';
  } else {
    chatRoomId = '${_receiver.uid}-${currentUser.uid}';
  }
  print("Chat Room ID: $chatRoomId"); 
}

  saveMessage() async {
    try {
      final now = DateTime.now();
      final message = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp: DateTime.now().toIso8601String(),
        content: _messageController.text,
        senderId: currentUser.uid ?? '',
        receiverId: _receiver.uid ?? '',
      );
      await _chatService.saveMessage(message.toMap(), chatRoomId);
      _messageController.clear();
    } catch (e) {
      print("Error saving message: $e");
    }
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}
