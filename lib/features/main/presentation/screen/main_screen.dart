import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_cashier/features/auth/presentation/application/auth_controller.dart';
import 'package:my_cashier/features/main/presentation/application/main_controller.dart';
import 'package:my_cashier/route/route_name.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.navbarIndex,
          onTap: (index) {
            controller.changeNavbarIndex(index);
          },
          selectedLabelStyle: TextStyle(
            color: Get.theme.primaryColor,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          selectedItemColor: Get.theme.primaryColor,
          items: const [
            BottomNavigationBarItem(
              label: "Menu",
              icon: Icon(LineIcons.receipt),
            ),
            BottomNavigationBarItem(
              label: "Riwayat",
              icon: Icon(LineIcons.history),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Get.theme.primaryColor,
          child: const Icon(
            LineIcons.wavyMoneyBill,
          ),
          onPressed: () {},
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                          style: Get.textTheme.headline4?.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Get.find<AuthController>().logout();
                      },
                      icon: const Icon(LineIcons.alternateSignOut),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GetRouterOutlet(
                    initialRoute: RouteName.mainRoute + RouteName.menuRoute,
                    anchorRoute: RouteName.mainRoute,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
