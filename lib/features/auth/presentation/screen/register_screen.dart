import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_cashier/features/auth/presentation/application/register_controller.dart';
import 'package:my_cashier/presentation/widget/app_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/img_logo.png',
                  height: 128,
                ),
                const SizedBox(height: 24),
                Text(
                  "MyCashier",
                  style: Get.textTheme.headline3,
                ),
                const SizedBox(height: 48),
                FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        name: 'email',
                        hint: "Alamat Email",
                        action: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        name: 'password',
                        hint: "Password",
                        obscure: controller.isObscurePassword,
                        action: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                        ]),
                        suffix: GestureDetector(
                          onTap: () {
                            controller.togglePasswordVisibility();
                          },
                          child: Icon(
                            color: Colors.grey,
                            controller.isObscurePassword
                                ? LineIcons.eye
                                : LineIcons.eyeSlash,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        name: 'confirm-password',
                        hint: "Confirm Password",
                        obscure: controller.isObscureConfirmPassword,
                        action: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(8),
                        ]),
                        suffix: GestureDetector(
                          onTap: () {
                            controller.toggleConfirmPasswordVisibility();
                          },
                          child: Icon(
                            color: Colors.grey,
                            controller.isObscureConfirmPassword
                                ? LineIcons.eye
                                : LineIcons.eyeSlash,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                MaterialButton(
                  minWidth: Get.width,
                  elevation: 0,
                  highlightElevation: 0,
                  color: Get.theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Register",
                    style:
                        Get.textTheme.headline5?.copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    if (controller.formKey.currentState!.saveAndValidate()) {
                      controller.register();
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Login",
                    style: Get.textTheme.headline6
                        ?.copyWith(color: Get.theme.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
