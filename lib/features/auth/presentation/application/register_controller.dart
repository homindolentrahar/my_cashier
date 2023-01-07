import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:my_cashier/features/auth/domain/repository/i_auth_repository.dart';
import 'package:my_cashier/route/route_name.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class RegisterController extends GetxController {
  final IAuthRepository repository;

  RegisterController(this.repository);

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  void togglePasswordVisibility() {
    isObscurePassword = !isObscurePassword;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    isObscureConfirmPassword = !isObscureConfirmPassword;
    update();
  }

  Future<void> register() async {
    if (formKey.currentState!.value['password'] !=
        formKey.currentState!.value['confirm-password']) {
      EasyDialogHelper.showError(
        "Password dan Password konfirmasi tidak cocok",
      );
      return;
    }

    EasyDialogHelper.showLoading();

    final formData = formKey.currentState!.value;
    final result = await repository.register(
      email: formData['email'],
      password: formData['password'],
    );

    EasyDialogHelper.hideDialog();

    result.fold(
      (error) {
        EasyDialogHelper.showError(error);
      },
      (admin) {
        EasyDialogHelper.showSuccess("Sukses membuat akun!");
        Get.offAllNamed(RouteName.authRoute);
      },
    );
  }
}
