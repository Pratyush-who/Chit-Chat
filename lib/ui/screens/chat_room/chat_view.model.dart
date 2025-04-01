import 'package:firebasechat/core/models/message_modal.dart';
import 'package:firebasechat/core/models/user_models.dart';
import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/chat_service.dart';
import 'package:flutter/cupertino.dart';

class ChatViewModel extends BaseView {
  final ChatService _chatService;
  final UserModel _currentUser;
  final UserModel _receiver;

  ChatViewModel(this._chatService, this._currentUser, this._receiver) {
    getchatRoom();
  }
  String chatRoomId = '';

  final _messageController = TextEditingController();

  TextEditingController get controller => _messageController;

  getchatRoom() {
    if (_currentUser.uid.hashCode > _receiver.uid.hashCode) {
      chatRoomId = '${_currentUser.uid}-${_receiver.uid}';
    } else {
      chatRoomId = '${_receiver.uid}-${_currentUser.uid}';
    }
  }
  saveMessage() async {
    try {
      final now = DateTime.now();
      final message = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        timestamp: DateTime.now().toIso8601String(),
        content: _messageController.text,
        senderId: _currentUser.uid,
        receiverId: _receiver.uid,
      );
      await _chatService.saveMessage(message.toMap(), chatRoomId);
      _messageController.clear();
    } catch (e) {
      print("Error saving message: $e");
    }
  }
}