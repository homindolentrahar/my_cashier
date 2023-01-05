import 'package:get/get.dart';
import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/auth/data/repository/auth_repository.dart';
import 'package:my_cashier/features/auth/domain/repository/i_auth_repository.dart';
import 'package:my_cashier/features/auth/presentation/application/auth_controller.dart';
import 'package:my_cashier/features/menu/data/repository/menu_repository.dart';
import 'package:my_cashier/features/menu/domain/repository/i_menu_repository.dart';
import 'package:my_cashier/features/transaksi/data/repository/transaksi_repository.dart';
import 'package:my_cashier/features/transaksi/domain/repository/i_transaksi_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CashierDatabase>(CashierDatabase(), permanent: true);
    Get.put<IAuthRepository>(AuthRepository(Get.find<CashierDatabase>()));
    Get.put<IMenuRepository>(MenuRepository(Get.find<CashierDatabase>()));
    Get.put<ITransaksiRepository>(
        TransaksiRepository(Get.find<CashierDatabase>()));

    Get.put<AuthController>(AuthController(Get.find<IAuthRepository>()));
  }
}
