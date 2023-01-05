import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';
import 'package:my_cashier/features/transaksi/domain/repository/i_transaksi_repository.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class TransaksiController extends GetxController {
  final IMenuRepository menuRepository;
  final ITransaksiRepository transaksiRepository;

  TransaksiController({
    required this.menuRepository,
    required this.transaksiRepository,
  });

  List<Menu>? menus;
  List<TransaksiDetail> selectedTransaksi = [];

  @override
  void onInit() {
    listenAllMenus();
    super.onInit();
  }

  bool checkIsMenuSelected(int id) =>
      selectedTransaksi.firstWhereOrNull((element) => element.menu?.id == id) !=
      null;

  TransaksiDetail? currentOrder(int id) =>
      selectedTransaksi.firstWhereOrNull((element) => element.menu?.id == id);

  void addOrder(TransaksiDetail item) {
    if (selectedTransaksi
            .firstWhereOrNull((element) => element.menu?.id == item.menu?.id) !=
        null) {
      selectedTransaksi = [
        ...selectedTransaksi
            .where((element) => element.menu?.id != item.menu?.id)
            .toList(),
      ];
    }
    selectedTransaksi = [...selectedTransaksi, item];
    Logger().w("Selected: ${selectedTransaksi.length}");
    update();
  }

  void removeOrder(int menuId) {
    selectedTransaksi = [
      ...selectedTransaksi
          .where((element) => element.menu?.id != menuId)
          .toList(),
    ];
    Logger().w("Selected: ${selectedTransaksi.length}");
    update();
  }

  void listenAllMenus() {
    menuRepository.watchAllMenus().listen(
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

  Future<void> createTransaksi() async {
    EasyDialogHelper.showLoading();

    final result = await transaksiRepository.createTransaksi(selectedTransaksi);

    EasyDialogHelper.hideDialog();

    result.fold(
      (error) {
        EasyDialogHelper.showError(error);
      },
      (_) {
        Get.back();
        Get.back();
        EasyDialogHelper.showSuccess("Berhasill membuat transaksi");
      },
    );
  }
}
