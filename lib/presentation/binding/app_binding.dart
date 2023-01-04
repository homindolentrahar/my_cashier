import 'package:get/get.dart';
import 'package:my_cashier/data/local/cashier_database.dart';
import 'package:my_cashier/features/auth/data/repository/auth_repository.dart';
import 'package:my_cashier/features/auth/domain/repository/i_auth_repository.dart';
import 'package:my_cashier/features/auth/presentation/application/auth_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IAuthRepository>(AuthRepository(CashierDatabase()));

    Get.put<AuthController>(AuthController(Get.find<IAuthRepository>()));
  }
}
