import 'package:eshop/app/routes/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final otpControllers = List<TextEditingController>.generate(
      4, (index) => TextEditingController());

  final focusNodes =
      List<FocusNode>.generate(4, (index) => FocusNode()); // List.generate

  void navigateToOtp() {
    Get.offAllNamed(Routes.OTP);
  }

  void verifyOtp() {
    otpControllers.map((controller) => controller.text).join("");
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }

    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
