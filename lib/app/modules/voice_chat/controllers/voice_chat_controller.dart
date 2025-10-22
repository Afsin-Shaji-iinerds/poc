import 'package:flutter/foundation.dart';
import 'package:funds_32bj_poc/app/common/const/url_const/url_const.dart';
import 'package:funds_32bj_poc/app/core/network/client/api_client.dart';
import 'package:funds_32bj_poc/app/core/network/helper/api_helper.dart';
import 'package:funds_32bj_poc/app/core/utils/helper/widgets/helper_widgets.dart';
import 'package:get/get.dart';

class VoiceChatController extends GetxController {
  //TODO: Implement VoiceChatController

  RxString transcriptText = ''.obs;
  RxBool isAgentSpeaking = false.obs;
    RxBool isUserSpeaking = false.obs;
    RxBool isGetTokenloading = false.obs;
  Future<String> getToken() async {
      String token='';
     await ApiHelper.callApi<String?>(
      loadingFlag: isGetTokenloading,
      request: () => ApiClient().dio.get(
        UrlConst.getToken,
      
      ),
      onSuccess: (dynamic resp) {
        if(resp.data!=null){
        token =  resp.data['token'];
        }
        return token;
      },
      onFailure: (dynamic resp) {
        final String message = resp.data['message'] ?? 'Something went wrong!';
        HelperWidgets.buildStatusSnackBar(
          title: 'Voice Chat',
          message: message,
          isSuccess: false,
        );
      },
      debugLog: kDebugMode,
    );
    return token;
  }
}


