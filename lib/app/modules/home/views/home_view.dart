import 'package:eshop/app/modules/home/controllers/home_controller.dart';
import 'package:eshop/app/utils/constants/colors.dart';
import 'package:eshop/app/utils/constants/sizes.dart';
import 'package:eshop/app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _currentLocation(context),
                      _loginDetails(context),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _searchBox(context),
                  const SizedBox(height: 30),
                  _buildCarouselWithIndicator(context),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselWithIndicator(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Obx(() {
            return CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.5,
                onPageChanged: (index, reason) {
                  controller.currentPage.value = index;
                },
              ),
              items: controller.carouselItems.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }),
        ),
        const SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.carouselItems.length,
                (index) =>
                    _buildIndicator(index == controller.currentPage.value),
              ),
            )),
      ],
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 4.0,
      width: isActive ? 24.0 : 5.0,
      decoration: BoxDecoration(
          color: isActive ? TColors.carouselColor : TColors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: TColors.carouselColor,
          )),
    );
  }

  Widget _searchBox(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
              ),
              labelText: TTexts.searchInputLabelText,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: TSizes.iconExLg,
          width: TSizes.iconExLg,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: TColors.textGrey,
          ),
          child: const Center(
            child: Icon(
              Icons.filter_alt,
            ),
          ),
        ),
      ],
    );
  }

  Widget _currentLocation(BuildContext context) {
    return Row(
      children: [
        Container(
          height: TSizes.iconExLg,
          width: TSizes.iconExLg,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: TColors.textGrey,
          ),
          child: Center(
            child: SvgPicture.asset(
              alignment: Alignment.center,
              "assets/logos/location.svg",
              semanticsLabel: "Location",
              height: TSizes.iconSm,
              width: TSizes.iconXs,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Current location",
                  style: TextStyle(color: TColors.textGrey),
                ),
                const SizedBox(width: TSizes.xs),
                SvgPicture.asset(
                  "assets/logos/caret-down.svg",
                  alignment: Alignment.center,
                  height: 12,
                  width: 24,
                ),
              ],
            ),
            Obx(() => Text(
                  controller.location.value,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    );
  }

  Widget _loginDetails(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Hello",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: TColors.textGrey,
                fontSize: TSizes.fontSizeSm,
              ),
            ),
            Obx(() => Text(
                  controller.loginName.value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeSm,
                  ),
                )),
          ],
        ),
        const SizedBox(width: 10),
        Container(
          height: TSizes.iconExLg,
          width: TSizes.iconExLg,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: TColors.textGrey,
          ),
          child: Center(
            child: SvgPicture.asset(
              alignment: Alignment.center,
              "assets/logos/location.svg",
              semanticsLabel: "Location",
              height: TSizes.iconSm,
              width: TSizes.iconXs,
            ),
          ),
        ),
      ],
    );
  }
}
