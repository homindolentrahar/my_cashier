import 'package:get/get.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/features/menu/presentation/application/detail_crud_menu_controller.dart';

class DetailCrudMenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailCrudMenuController(Get.find<IMenuRepository>()));
  }
}
