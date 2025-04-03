import 'dart:convert';

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String? content;
  final String timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'timestamp': timestamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    try {
      return Message(
        id: map['id']?.toString() ?? DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: map['senderId']?.toString() ?? '',
        receiverId: map['receiverId']?.toString() ?? '',
        content: map['content']?.toString(),
        timestamp: map['timestamp']?.toString() ?? DateTime.now().toIso8601String(),
      );
    } catch (e) {
      print('Error parsing Message: $e');
      rethrow;
    }
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) {
    try {
      return Message.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      print('Error decoding Message JSON: $e');
      rethrow;
    }
  }

  @override
  String toString() {
    return 'Message('
        'id: $id, '
        'senderId: $senderId, '
        'receiverId: $receiverId, '
        'content: $content, '
        'timestamp: $timestamp'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Message &&
        other.id == id &&
        other.senderId == senderId &&
        other.receiverId == receiverId &&
        other.content == content &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        senderId.hashCode ^
        receiverId.hashCode ^
        content.hashCode ^
        timestamp.hashCode;
  }
}