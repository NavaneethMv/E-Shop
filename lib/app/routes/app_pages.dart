import 'package:get/get.dart';
import 'package:eshop/app/modules/onbording/views/onbording_view.dart';
import 'package:eshop/app/modules/onbording/bindings/onbording_bindings.dart';
import 'package:eshop/app/routes/app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ONBORDING;

  static final routes = [
    GetPage(
      name: Routes.ONBORDING,
      page: () => OnBordingView(),
      binding: OnBordingBinding(),
    ),
  ];
}
