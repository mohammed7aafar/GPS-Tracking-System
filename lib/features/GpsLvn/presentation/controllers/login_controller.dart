import 'package:get/get.dart';

class LoginController extends GetxController {
  var isRemembered = false.obs;
  var hostServerName = "Host Server".obs;

  rememberMe(value) => isRemembered.value = value;

  selectTrackingServer(String host) {
    hostServerName.value = host;
    Get.back();
  }
}
