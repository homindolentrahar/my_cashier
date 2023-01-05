import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFillButton extends StatelessWidget {
  const AppFillButton({
    super.key,
    this.color,
    required this.text,
    this.textStyle,
    required this.onPressed,
  });

  final Color? color;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Get.width,
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(16),
      color: color ?? Get.theme.primaryColor,
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle ??
            Get.textTheme.headline5?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
