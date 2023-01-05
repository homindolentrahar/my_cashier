import 'package:get/get.dart';
import 'package:my_cashier/features/main/presentation/application/main_controller.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/features/menu/presentation/application/menu_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.put(MenuController(Get.find<IMenuRepository>()));
  }
}
