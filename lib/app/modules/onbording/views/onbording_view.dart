import 'package:eshop/app/utils/constants/image_strings.dart';
import 'package:eshop/app/utils/constants/sizes.dart';
import 'package:eshop/app/utils/constants/text_strings.dart';
import 'package:eshop/app/utils/device/device_utlity.dart';
import 'package:eshop/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:eshop/app/modules/onbording/controllers/onbording_controller.dart';

class OnBordingView extends GetView<OnBordingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Image(
                      width: THelperFunctions.screenWidth() * 0.8,
                      height: THelperFunctions.screenHeight() * 0.6,
                      image: const AssetImage(TImages.delivery),
                    ),
                    const Text(
                      TTexts.onBoardingTitle1,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      TTexts.onBoardingSubTitle1,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: TDeviceUtils.getAppBarHeight(),
              right: TSizes.defauItSpace,
              child: TextButton(onPressed: () {}, child: const Text('skip'))),
          Positioned(
              right: TSizes.defauItSpace,
              bottom: TDeviceUtils.getBottomNavigationBarHeight(),
              child: ElevatedButton(
                onPressed: () => controller,
                child: const Icon(Iconsax.arrow_right_3),
              ))
        ],
      ),
    );
  }
}
