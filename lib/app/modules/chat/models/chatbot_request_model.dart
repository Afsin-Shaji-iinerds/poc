class ChatRequestModel {
  ChatRequestModel({
    required this.userId,
    required this.sessionId,
    required this.question,
  });

  final String userId;
  final String sessionId;
  final String question;

  Map<String, dynamic> toJson() => <String,dynamic >{
        'user_id': userId,
        'session_id': sessionId,
        'question': question,
      };
}
