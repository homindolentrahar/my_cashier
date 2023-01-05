import 'package:get/get.dart';
import 'package:my_cashier/features/auth/presentation/screen/binding/login_binding.dart';
import 'package:my_cashier/features/auth/presentation/screen/binding/register_binding.dart';
import 'package:my_cashier/features/auth/presentation/screen/login_screen.dart';
import 'package:my_cashier/features/auth/presentation/screen/register_screen.dart';
import 'package:my_cashier/features/main/presentation/binding/main_binding.dart';
import 'package:my_cashier/features/main/presentation/screen/main_screen.dart';
import 'package:my_cashier/features/menu/presentation/binding/detail_crud_menu_binding.dart';
import 'package:my_cashier/features/menu/presentation/screen/detail_crud_menu_screen.dart';
import 'package:my_cashier/features/menu/presentation/screen/menu_screen.dart';
import 'package:my_cashier/features/riwayat/presentation/screen/riwayat_screen.dart';
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
      binding: MainBinding(),
      children: [
        GetPage(
          name: RouteName.menuRoute,
          page: () => const MenuScreen(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: RouteName.riwayatRoute,
          page: () => const RiwayatScreen(),
          transition: Transition.fadeIn,
        ),
      ],
    ),
    // Detail
    GetPage(
      name: RouteName.detailMenuRoute,
      page: () => const DetailCrudMenuScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: DetailCrudMenuBinding(),
    ),
  ];
}
