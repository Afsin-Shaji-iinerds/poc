import 'package:get/get.dart';


import '../models/chat_message_model.dart';
import '../models/chatbot_request_model.dart';
import '../models/chatbot_response_model.dart';
import '../providers/chat_provider.dart';

class ChatController extends GetxController {
  RxList<ChatModel> chatList = <ChatModel>[].obs;
  RxBool isChatStarted = false.obs;
  RxBool isLoading = false.obs;

   String sessionId ="";
  late String hkUserId;

  @override
  void onInit() {
    super.onInit();
    hkUserId = '';
    initializeSession();
  }

  Future<void> initializeSession() async {
   // sessionId = await UserDataService.getChatSessionId();
    if (sessionId.isEmpty) {
      sessionId = generateSessionId();
      //await UserDataService.saveChatSessionId(sessionId);
    }
  }

  String generateSessionId() {
    return 'ssn_${DateTime.now().millisecondsSinceEpoch}';
  }

Future<void> sendMessage(String message) async {
  if (message.trim().isEmpty) return;

  isChatStarted.value = true;

  // Safely get user name from UserDataService
  final String senderName = "New User";
  // 1. Add user message
  chatList.insert(
    0,
    ChatModel(
      message: message,
      sender: "user",
      senderName: senderName,
      timestamp: DateTime.now(),
    ),
  );

  // 2. Insert typing indicator
  final ChatModel typingIndicator = ChatModel(
    message: "HealthKarma AI is typing...",
    sender: "typing",
    timestamp: DateTime.now(),
  );
  chatList.insert(0, typingIndicator);

  // 3. Send API request
  final ChatRequestModel request = ChatRequestModel(
    hkUserId: hkUserId,
    sessionId: sessionId,
    question: message,
  );

  final ChatResponse? response = await ChatProvider.sendMessage(
    request: request,
    loadingFlag: isLoading,
  );

  // 4. Remove typing indicator
  chatList.remove(typingIndicator);

  // 5. Add actual bot response
  chatList.insert(
    0,
    ChatModel(
      message: response?.data.message ??
          "Sorry, something went wrong. Please try again.",
      sender: "bot",
      timestamp: DateTime.now(),
    ),
  );
}


  void skipToVoiceCall() {
    // Get.toNamed(Routes.CHAT_CALL);
  }

    void skipToVideoCall() {
    // Get.toNamed(Routes.CHAT_VIDEO_CALL);
  }
}
