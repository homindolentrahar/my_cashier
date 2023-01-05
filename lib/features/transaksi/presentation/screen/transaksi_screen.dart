import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:logger/logger.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/transaksi/presentation/application/transaksi_controller.dart';
import 'package:my_cashier/features/transaksi/presentation/widget/transaksi_confirm_sheet.dart';
import 'package:my_cashier/features/transaksi/presentation/widget/transaksi_item_sheet.dart';
import 'package:my_cashier/features/transaksi/presentation/widget/transaksi_list_item.dart';
import 'package:my_cashier/util/helper/easy_dialog_helper.dart';

class TransaksiScreen extends StatelessWidget {
  const TransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              LineIcons.arrowLeft,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Buat Transaksi",
            style: Get.textTheme.headline5,
          ),
        ),
        bottomNavigationBar: MaterialButton(
          elevation: 0,
          highlightElevation: 0,
          color: Get.theme.primaryColor,
          padding: const EdgeInsets.all(16),
          child: Text(
            "Konfirmasi Transaksi",
            style: Get.textTheme.headline5?.copyWith(color: Colors.white),
          ),
          onPressed: () {
            if (controller.selectedTransaksi.isNotEmpty) {
              Get.bottomSheet(
                TransaksiConfirmSheet(
                  details: controller.selectedTransaksi,
                  onConfirm: () {
                    controller.createTransaksi();
                  },
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            } else {
              EasyDialogHelper.showError("Pilih salah satu menu!");
            }
          },
        ),
        body: SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.menus?.length ?? 0,
            separatorBuilder: (ctx, index) => const SizedBox(height: 16),
            itemBuilder: (ctx, index) => TransaksiListItem(
              isSelected: controller.checkIsMenuSelected(
                controller.menus?[index].id ?? 0,
              ),
              order: controller.currentOrder(
                controller.menus?[index].id ?? 0,
              ),
              menu: controller.menus?[index] ?? Menu(),
              onTap: (menu) async {
                await Get.bottomSheet(
                  TransaksiItemSheet(
                    menu: menu,
                    order: controller.currentOrder(
                      controller.menus?[index].id ?? 0,
                    ),
                    onConfirm: (value) {
                      if (value != null) {
                        Logger().i(
                            "Order: ${value.menu?.nama}, Subtotal: ${value.subtotal}");
                        controller.addOrder(value);
                      }
                    },
                    onCancel: (value) {
                      if (value != null) {
                        controller.removeOrder(value);
                      }
                    },
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
