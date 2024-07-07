import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString loginName = "Sample Name".obs;
  RxString location = "Kochi, Kerala".obs;
  var carouselItems = [].obs;
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCarouselItems();
  }

  void fetchCarouselItems() {
    carouselItems.value = [
      'assets/images/profile.jpeg',
      'assets/logos/facebook.png'
    ];
  }
}
