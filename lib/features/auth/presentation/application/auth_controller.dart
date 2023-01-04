import 'package:get/get.dart';
import 'package:my_cashier/features/auth/domain/repository/i_auth_repository.dart';
import 'package:my_cashier/route/route_name.dart';
import 'package:my_cashier/util/helper/secure_storage_helper.dart';

class AuthController extends GetxController {
  final IAuthRepository repository;

  AuthController(this.repository) {
    Future.delayed(const Duration(seconds: 2), () {
      checkAuthenticated();
    });
  }

  Future<void> checkAuthenticated() async {
    final result = await repository.checkAuthenticated();

    result.fold(
      () {
        Get.offAllNamed(RouteName.authRoute);
      },
      (admin) {
        Get.offAllNamed(RouteName.mainRoute);
      },
    );
  }

  Future<void> logout() async {
    await SecureStorageHelper.instance.clearCredential();

    Get.offAllNamed(RouteName.authRoute);
  }
}
