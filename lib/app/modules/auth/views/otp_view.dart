import 'package:eshop/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpView extends GetView<AuthController> {
  List<String> otp = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Image.asset('assets/images/delivery.gif'),
            const SizedBox(height: 30),
            _otpTextField(context, controller),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle resend action
                  },
                  child: const Text('Resend'),
                ),
                ElevatedButton(
                  onPressed: controller.verifyOtp,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, AuthController controller) {
    List<Widget> list = <Widget>[];

    for (var i = 0; i < controller.otpControllers.length; i++) {
      list.add(_buildOtpBox(context, i, controller));
    }
    return (Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: list));
  }

  Widget _buildOtpBox(
      BuildContext context, int index, AuthController controller) {
    return SizedBox(
      width: 40,
      child: TextField(
        controller: controller.otpControllers[index],
        focusNode: controller.focusNodes[index],
        onChanged: (value) {
          if (value.length == 1) {
            if (index + 1 < controller.focusNodes.length) {
              FocusScope.of(context)
                  .requestFocus(controller.focusNodes[index + 1]);
            } else {
              FocusScope.of(context).unfocus();
            }
          } else if (value.isEmpty && index - 1 >= 0) {
            FocusScope.of(context)
                .requestFocus(controller.focusNodes[index - 1]);
          }
        },
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
