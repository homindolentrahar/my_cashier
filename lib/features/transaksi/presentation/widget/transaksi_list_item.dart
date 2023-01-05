import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cashier/features/menu/domain/model/menu.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';

class TransaksiListItem extends StatelessWidget {
  const TransaksiListItem({
    super.key,
    required this.menu,
    this.order,
    required this.onTap,
    this.isSelected = false,
  });

  final Menu menu;
  final TransaksiDetail? order;
  final Function(Menu menu) onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: isSelected ? Get.theme.primaryColor : Colors.white,
          borderRadius: isSelected
              ? const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                )
              : BorderRadius.circular(8),
          child: InkWell(
            borderRadius: isSelected
                ? const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )
                : BorderRadius.circular(8),
            onTap: () => onTap(menu),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: isSelected
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )
                    : BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.25),
                  width: isSelected ? 0 : 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu.nama ?? "",
                          style: Get.textTheme.headline5?.copyWith(
                              color: isSelected ? Colors.white : Colors.black),
                        ),
                        Visibility(
                          visible: menu.description != null,
                          child: Column(
                            children: [
                              const SizedBox(height: 2),
                              Text(
                                menu.description ?? "",
                                style: Get.textTheme.bodyText2?.copyWith(
                                    color: isSelected
                                        ? Colors.white.withOpacity(0.75)
                                        : Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: Get.textTheme.bodyText2?.copyWith(
                                color:
                                    isSelected ? Colors.white : Colors.black),
                            children: [
                              const TextSpan(text: "Stock: "),
                              TextSpan(
                                  text: menu.stock.toString(),
                                  style: Get.textTheme.bodyText2?.copyWith(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    menu.harga.toString(),
                    style: Get.textTheme.headline6?.copyWith(
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isSelected,
          child: Container(
            decoration: BoxDecoration(
              color: Get.theme.primaryColor.withOpacity(0.25),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total (${order?.quantity}): ",
                  style: Get.textTheme.headline6?.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  order?.subtotal?.toString() ?? "",
                  style: Get.textTheme.headline6?.copyWith(
                    color: Get.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
