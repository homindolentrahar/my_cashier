import 'package:get/get.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/route/route_name.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class MenuController extends GetxController {
  final IMenuRepository repository;

  MenuController(this.repository);

  @override
  void onInit() {
    listenAllMenus();
    super.onInit();
  }

  List<Menu>? menus;

  void navigateToDetail(Menu data) {
    Get.toNamed(
      RouteName.detailMenuRoute,
      arguments: data,
    );
  }

  Future<void> listenAllMenus() async {
    repository.watchAllMenus().listen(
          (either) => either.fold(
            (error) {
              EasyDialogHelper.showError(error);
            },
            (list) {
              menus = list;
              update();
            },
          ),
        );
  }
}
