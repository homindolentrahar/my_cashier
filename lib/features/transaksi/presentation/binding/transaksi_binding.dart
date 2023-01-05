import 'package:get/get.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/features/transaksi/domain/repository/i_transaksi_repository.dart';
import 'package:my_cashier/features/transaksi/presentation/application/transaksi_controller.dart';

class TransaksiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TransaksiController(
        menuRepository: Get.find<IMenuRepository>(),
        transaksiRepository: Get.find<ITransaksiRepository>(),
      ),
    );
  }
}
