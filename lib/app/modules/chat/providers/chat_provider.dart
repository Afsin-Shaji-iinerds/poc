import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../common/const/url_const/url_const.dart';
import '../../../core/network/client/api_client.dart';
import '../../../core/network/helper/api_helper.dart';
import '../../../core/utils/helper/widgets/helper_widgets.dart';
import '../models/chatbot_request_model.dart';
import '../models/chatbot_response_model.dart';

class ChatProvider {
  static Future<ChatResponse?> sendMessage({
    required ChatRequestModel request,
    required RxBool loadingFlag,
  }) async {
    return await ApiHelper.callApi<ChatResponse?>(
      loadingFlag: loadingFlag,
      request: () => ApiClient().dio.post(
        UrlConst.sendChatbotMessage,
        data: request.toJson(),
      ),
      onSuccess: (dynamic resp) => ChatResponse.fromJson(resp.data),
      onFailure: (dynamic resp) {
        final String message = resp.data['message'] ?? 'Something went wrong!';
        HelperWidgets.buildStatusSnackBar(
          title: 'Chat bot',
          message: message,
          isSuccess: false,
        );
      },
      debugLog: kDebugMode,
    );
  }
}
