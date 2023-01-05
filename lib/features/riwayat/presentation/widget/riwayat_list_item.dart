import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_cashier/model/transaksi_with_menu.dart';

class RiwayatListItem extends StatelessWidget {
  const RiwayatListItem({super.key, required this.data});

  final TransaksiWithDetails data;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Transaksi #${data.transaksi?.idTransaksi}",
            style: Get.textTheme.headline5?.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            DateFormat.yMMMMd()
                .format(data.transaksi?.tanggal ?? DateTime.now()),
            style: Get.textTheme.bodyText2?.copyWith(
              color: Colors.grey,
            ),
          )
        ],
      ),
      collapsed: Text(
        "${data.details?.map((e) => e.menu?.nama).join(', ')}",
        style: Get.textTheme.bodyText1?.copyWith(
          color: Colors.black,
        ),
      ),
      expanded: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Transaksi",
              style: Get.textTheme.headline6?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.details?.length ?? 0,
              itemBuilder: (ctx, index) {
                final detail = data.details?[index];

                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        detail?.menu?.nama ?? "Nama Item",
                        style: Get.textTheme.headline6
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "${detail?.quantity} pcs",
                      style:
                          Get.textTheme.headline6?.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        detail?.subtotal?.toString() ?? "-",
                        textAlign: TextAlign.end,
                        style: Get.textTheme.headline6
                            ?.copyWith(color: Get.theme.primaryColor),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (ctx, index) => const SizedBox(height: 12),
            )
          ],
        ),
      ),
    );
  }
}
