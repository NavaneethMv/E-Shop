import 'package:eshop/app/routes/app_routes.dart';
import 'package:get/get.dart';

class OnBordingController extends GetxController {
  void navigateToLogin() {
    Get.offAllNamed(Routes.AUTH);
  }
}
