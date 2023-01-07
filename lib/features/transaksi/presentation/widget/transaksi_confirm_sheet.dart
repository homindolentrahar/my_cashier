import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cashier/features/transaksi/domain/model/transaksi_item_with_transaksi_menu.dart';
import 'package:my_cashier/presentation/widget/app_fill_button.dart';
import 'package:my_cashier/util/extension/number_extensions.dart';

class TransaksiConfirmSheet extends StatelessWidget {
  const TransaksiConfirmSheet(
      {super.key, required this.details, required this.onConfirm});

  final List<TransaksiDetail> details;
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daftar Transaksi",
            style: Get.textTheme.headline5?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: details.length,
            itemBuilder: (ctx, index) {
              final detail = details[index];

              return Row(
                children: [
                  Expanded(
                    child: Text(
                      detail.menu?.nama ?? "Nama Item",
                      style: Get.textTheme.headline6
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "${detail.quantity} pcs",
                    style:
                        Get.textTheme.headline6?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      detail.subtotal?.toCurrency() ?? "-",
                      textAlign: TextAlign.end,
                      style: Get.textTheme.headline6
                          ?.copyWith(color: Get.theme.primaryColor),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (ctx, index) => const SizedBox(height: 8),
          ),
          const SizedBox(height: 12),
          const Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.grey,
            thickness: 0.5,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Total",
                  style: Get.textTheme.headline6?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "${details.fold(0, (previousValue, element) => previousValue += element.quantity ?? 0)} pcs",
                style: Get.textTheme.headline6?.copyWith(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  details
                      .fold(
                          0.0,
                          (previousValue, element) =>
                              previousValue += element.subtotal ?? 0.0)
                      .toCurrency(),
                  textAlign: TextAlign.end,
                  style: Get.textTheme.headline6?.copyWith(
                    color: Get.theme.primaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          AppFillButton(
            text: "Konfirmasi",
            onPressed: onConfirm,
          ),
        ],
      ),
    );
  }
}
