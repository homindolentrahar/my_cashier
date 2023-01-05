import 'package:get/get.dart';
import 'package:my_cashier/route/route_name.dart';

class MainController extends GetxController {
  int navbarIndex = 0;

  final routes = [
    RouteName.menuRoute,
    RouteName.riwayatRoute,
  ];

  void changeNavbarIndex(int index) {
    navbarIndex = index;
    Get.rootDelegate.toNamed(RouteName.mainRoute + routes[index]);
    update();
  }
}
