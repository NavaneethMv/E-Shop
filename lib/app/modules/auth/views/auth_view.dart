import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop/app/modules/auth/controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/delivery.gif',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter mobile number',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '+91',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: controller.navigateToOtp,
                child: const Text('Proceed'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
