class ChatResponse {
  ChatResponse({
    required this.status,
    required this.data,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      status: json['s'],
      data: ChatData.fromJson(json['d']),
    );
  }

  final String status;
  final ChatData data;
}

class ChatData {
  ChatData({required this.message});

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(message: json['message'] ?? '');
  }

  final String message;
}
