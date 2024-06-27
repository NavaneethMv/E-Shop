import 'package:get/get.dart';
import 'package:eshop/app/modules/onbording/controllers/onbording_controller.dart';

class OnBordingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBordingController>(() => OnBordingController());
  }
}
