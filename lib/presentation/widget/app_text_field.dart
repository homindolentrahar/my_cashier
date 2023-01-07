import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.initialValue,
    required this.name,
    required this.hint,
    this.hintStyle,
    this.style,
    this.suffix,
    this.obscure = false,
    this.maxLines = 1,
    this.action = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.onSubmit,
    this.validator,
  });

  final String? initialValue;
  final String name;
  final String hint;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Widget? suffix;
  final bool obscure;
  final int? maxLines;
  final TextInputAction action;
  final TextInputType keyboardType;
  final ValueChanged<String?>? onSubmit;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      initialValue: initialValue,
      name: name,
      obscureText: obscure,
      textInputAction: action,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      style: style ??
          Get.textTheme.bodyText1?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
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
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Get.theme.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
