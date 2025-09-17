class ChatModel {

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'] ?? '',
      sender: json['sender'] ?? '',
      senderName: json['senderName'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
  ChatModel({
    required this.message,
    required this.sender,
    required this.timestamp, this.senderName,
  });

  final String message;
  final String sender; // Use "user" or "bot"
  final String? senderName;
  final DateTime timestamp;

  Map<String, dynamic> toJson() {
    return <String,dynamic >{
      'message': message,
      'sender': sender,
      'senderName': senderName,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
