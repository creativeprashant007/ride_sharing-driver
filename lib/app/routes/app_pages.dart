import 'package:get/get.dart';

import '../modules/additionaldriverinfo/bindings/additionaldriverinfo_binding.dart';
import '../modules/additionaldriverinfo/views/additionaldriverinfo_view.dart';
import '../modules/driverdashboard/bindings/driverdashboard_binding.dart';
import '../modules/driverdashboard/views/driverdashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.ADDITIONALDRIVERINFO,
      page: () => const AdditionaldriverinfoView(),
      binding: AdditionaldriverinfoBinding(),
    ),
    GetPage(
      name: _Paths.DRIVERDASHBOARD,
      page: () => const DriverdashboardView(),
      binding: DriverdashboardBinding(),
    ),
  ];
}
