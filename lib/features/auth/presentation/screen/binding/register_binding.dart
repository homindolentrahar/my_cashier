import 'package:get/get.dart';
import 'package:my_cashier/features/auth/domain/repository/i_auth_repository.dart';
import 'package:my_cashier/features/auth/presentation/application/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(Get.find<IAuthRepository>()));
  }
}
