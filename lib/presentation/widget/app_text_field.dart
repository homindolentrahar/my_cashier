import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.name,
    required this.hint,
    this.hintStyle,
    this.style,
    this.suffix,
    this.obscure = false,
    this.action = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.onSubmit,
    this.validator,
  });

  final String name;
  final String hint;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Widget? suffix;
  final bool obscure;
  final TextInputAction action;
  final TextInputType keyboardType;
  final ValueChanged<String?>? onSubmit;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      obscureText: obscure,
      textInputAction: action,
      keyboardType: keyboardType,
      validator: validator,
      style: style ??
          Get.textTheme.bodyText1?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ??
            Get.textTheme.bodyText1?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Get.theme.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
