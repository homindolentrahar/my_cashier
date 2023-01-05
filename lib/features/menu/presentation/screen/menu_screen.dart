import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/menu/presentation/application/menu_controller.dart';
import 'package:my_cashier/features/menu/presentation/widget/menu_list_item.dart';
import 'package:my_cashier/route/route_name.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(builder: (controller) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Daftar Menu",
                    style: Get.textTheme.bodyText1
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              MaterialButton(
                elevation: 0,
                highlightElevation: 0,
                color: Get.theme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      LineIcons.plus,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Tambah",
                      style: Get.textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.toNamed(
                    RouteName.detailMenuRoute,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.menus?.length ?? 0,
              separatorBuilder: (ctx, index) => const SizedBox(height: 16),
              itemBuilder: (ctx, index) => MenuListItem(
                data: controller.menus?[index] ?? Menu(),
                onTap: (data) {
                  controller.navigateToDetail(data);
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
