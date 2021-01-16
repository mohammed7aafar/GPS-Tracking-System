import 'package:get/get.dart';

class ReportsController extends GetxController {
  var isRemembered = false.obs;

  rememberMe(value) => isRemembered.value = value;
}
