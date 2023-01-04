import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_cashier/features/auth/presentation/application/auth_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/img_logo.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "MyCashier",
                        style: Get.textTheme.headline4
                            ?.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.find<AuthController>().logout();
                    },
                    icon: const Icon(Iconsax.logout),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(),
            ),
          ],
        ),
      ),
    );
  }
}
