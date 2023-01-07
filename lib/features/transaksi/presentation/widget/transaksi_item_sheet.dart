import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';
import 'package:my_cashier/features/transaksi/presentation/application/transaksi_item_controller.dart';
import 'package:my_cashier/presentation/widget/app_fill_button.dart';
import 'package:my_cashier/util/extension/number_extensions.dart';

class TransaksiItemSheet extends StatelessWidget {
  const TransaksiItemSheet({
    super.key,
    this.order,
    this.menu,
    required this.onConfirm,
    required this.onCancel,
  });

  final TransaksiDetail? order;
  final Menu? menu;
  final ValueChanged<TransaksiDetail?> onConfirm;
  final ValueChanged<int?> onCancel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransaksiItemController>(
        init: TransaksiItemController(menu: menu, order: order),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu?.nama ?? "",
                          style: Get.textTheme.headline5
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          menu?.description ?? "",
                          style: Get.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: Get.textTheme.bodyText1
                                ?.copyWith(color: Colors.black),
                            children: [
                              const TextSpan(text: "Stock: "),
                              TextSpan(
                                text: menu?.stock.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      menu?.harga?.toCurrency() ?? "-",
                      style: Get.textTheme.headline6
                          ?.copyWith(color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: controller.quantity > 1
                                ? () {
                                    controller.amountChanged(-1);
                                  }
                                : null,
                            child: Icon(
                              LineIcons.minusCircle,
                              color: controller.quantity > 1
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            controller.quantity.toString(),
                            style: Get.textTheme.headline4
                                ?.copyWith(color: Colors.black),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            child: const Icon(LineIcons.plusCircle),
                            onTap: () {
                              controller.amountChanged(1);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      RichText(
                        text: TextSpan(
                          style: Get.textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                          children: [
                            const TextSpan(
                              text: "Subtotal: ",
                            ),
                            TextSpan(
                              text: controller.subtotal.toCurrency(),
                              style: Get.textTheme.headline4?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                AppFillButton(
                  text: "Simpan",
                  onPressed: () async {
                    onConfirm(await controller.getOrder());
                    Get.back();
                  },
                ),
                Visibility(
                  visible: order != null,
                  child: SizedBox(
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              LineIcons.trash,
                              color: Colors.red,
                            ),
                            TextButton(
                              onPressed: () {
                                onCancel(order?.menu?.id ?? 0);
                                Get.back();
                              },
                              child: Text(
                                "Batal",
                                style: Get.textTheme.headline5
                                    ?.copyWith(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
