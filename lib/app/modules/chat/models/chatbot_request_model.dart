class ChatRequestModel {
  ChatRequestModel({
    required this.hkUserId,
    required this.sessionId,
    required this.question,
  });

  final String hkUserId;
  final String sessionId;
  final String question;

  Map<String, dynamic> toJson() => <String,dynamic >{
        'hkUserId': hkUserId,
        'sessionId': sessionId,
        'question': question,
      };
}
