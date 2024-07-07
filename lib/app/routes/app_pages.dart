import 'package:get/get.dart';
import 'package:eshop/app/modules/auth/bindings/auth_binding.dart';
import 'package:eshop/app/modules/auth/views/otp_view.dart';
import 'package:eshop/app/modules/onbording/views/onbording_view.dart';
import 'package:eshop/app/modules/onbording/bindings/onbording_bindings.dart';
import 'package:eshop/app/routes/app_routes.dart';
import 'package:eshop/app/modules/auth/views/auth_view.dart';
import 'package:eshop/app/modules/home/views/home_view.dart';
import 'package:eshop/app/modules/home/bindings/home_bindings.dart';

class AppPages {
  static const INITIAL = Routes.ONBORDING;

  static final routes = [
    GetPage(
      name: Routes.ONBORDING,
      page: () => OnBordingView(),
      binding: OnBordingBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OtpView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
