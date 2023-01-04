import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/img_logo.png',
                height: 104,
              ),
              const SizedBox(height: 32),
              Text(
                "MyCashier",
                style: Get.textTheme.headline2
                    ?.copyWith(color: Get.theme.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
