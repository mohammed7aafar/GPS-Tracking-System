import 'package:get/get.dart';

class TrackController extends GetxController {
  var isRemembered = false.obs;
  
  rememberMe(value) => isRemembered.value = value;
  
}
