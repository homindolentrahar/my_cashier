import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:my_cashier/features/auth/domain/repository/i_auth_repository.dart';
import 'package:my_cashier/route/route_name.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class LoginController extends GetxController {
  final IAuthRepository repository;

  LoginController(this.repository);

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool isObscure = true;

  void togglePasswordVisibility() {
    isObscure = !isObscure;
    update();
  }

  Future<void> login() async {
    EasyDialogHelper.showLoading();

    final formData = formKey.currentState!.value;
    final result = await repository.login(
      email: formData['email'],
      password: formData['password'],
    );

    EasyDialogHelper.hideDialog();

    result.fold(
      (error) {
        EasyDialogHelper.showError(error);
      },
      (admin) {
        Get.offAllNamed(RouteName.mainRoute);
      },
    );
  }
}
