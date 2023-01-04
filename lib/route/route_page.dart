import 'package:get/get.dart';
import 'package:my_cashier/features/auth/presentation/screen/binding/login_binding.dart';
import 'package:my_cashier/features/auth/presentation/screen/binding/register_binding.dart';
import 'package:my_cashier/features/auth/presentation/screen/login_screen.dart';
import 'package:my_cashier/features/auth/presentation/screen/register_screen.dart';
import 'package:my_cashier/features/main/presentation/screen/main_screen.dart';
import 'package:my_cashier/presentation/screen/splash_screen.dart';
import 'package:my_cashier/route/route_name.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.authRoute,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.registerRoute,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RouteName.mainRoute,
      page: () => const MainScreen(),
    ),
  ];
}
