import 'package:get/get.dart';

class NotificationsController extends GetxController {
  var isRemembered = false.obs;
  var isRemembered2 = false.obs;
  var isRemembered3 = false.obs;
  var isRemembered4 = false.obs;
  var isRemembered5 = false.obs;
  var isRemembered6 = false.obs;
  rememberMe(value) => isRemembered.value = value;
  rememberMe2(value) => isRemembered2.value = value;
  rememberMe3(value) => isRemembered3.value = value;
  rememberMe4(value) => isRemembered4.value = value;
  rememberMe5(value) => isRemembered5.value = value;
  rememberMe6(value) => isRemembered6.value = value;
}
