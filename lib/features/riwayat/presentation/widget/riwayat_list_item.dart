import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_cashier/model/transaksi_with_menu.dart';
import 'package:my_cashier/util/extension/number_extensions.dart';

class RiwayatListItem extends StatelessWidget {
  const RiwayatListItem({super.key, required this.data});

  final TransaksiWithDetails data;

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
      ),
      collapsed: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${data.details?.length} item",
              style: Get.textTheme.bodyText1?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              data.details
                      ?.fold(
                          0.0,
                          (previousValue, element) =>
                              previousValue += element.subtotal ?? 0.0)
                      .toCurrency() ??
                  "-",
              style: Get.textTheme.bodyText1?.copyWith(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      expanded: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Transaksi",
              style: Get.textTheme.headline5?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
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
                        detail?.subtotal?.toCurrency() ?? "-",
                        textAlign: TextAlign.end,
                        style: Get.textTheme.headline6
                            ?.copyWith(color: Get.theme.primaryColor),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (ctx, index) => const SizedBox(height: 12),
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: 16,
              endIndent: 16,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Total: ",
                    style:
                        Get.textTheme.headline6?.copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  "${data.details?.fold(0, (previousValue, element) => previousValue += element.quantity ?? 0)} pcs",
                  style: Get.textTheme.headline6?.copyWith(color: Colors.grey),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    data.details
                            ?.fold(
                                0.0,
                                (previousValue, element) =>
                                    previousValue += element.subtotal ?? 0.0)
                            .toCurrency() ??
                        "-",
                    textAlign: TextAlign.end,
                    style: Get.textTheme.headline6
                        ?.copyWith(color: Get.theme.primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
