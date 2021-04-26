import 'package:get/get.dart';
import 'package:nti_calls_web/app/core/constants.dart';

class NotificationService extends GetConnect {
  Future<void> sendMessage(
      {required String token,
      String title = "Teste",
      String body = "Teste"}) async {
    try {
      post(AppConstants.FCM_REST_API_URL, {
        "message": {
          "token": token,
          "notification": {
            "title": title,
            "body": body,
          },
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
