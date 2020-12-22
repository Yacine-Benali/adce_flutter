import 'package:flutter/foundation.dart';

class Message {
  Message({
    @required this.content,
    @required this.type,
    @required this.receiverId,
    @required this.seen,
    @required this.senderId,
    @required this.timestamp,
    @required this.id,
  });
  final String content;
  final String id;
  final String receiverId;
  bool seen;
  final String senderId;
  final int timestamp;
  final int type;

  factory Message.fromMap(Map<String, dynamic> data, String documentId) {
    final String content = data['content'];
    final String receiverId = data['receiverId'];
    final bool seen = data['seen'];
    final String senderId = data['senderId'];
    final int timestamp = data['timestamp'];
    final int type = data['type'];

    return Message(
      content: content,
      type: type,
      receiverId: receiverId,
      seen: seen,
      senderId: senderId,
      timestamp: timestamp,
      id: documentId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'type': type,
      'receiverId': receiverId,
      'seen': seen,
      'senderId': senderId,
      'timestamp': timestamp,
    };
  }
}
